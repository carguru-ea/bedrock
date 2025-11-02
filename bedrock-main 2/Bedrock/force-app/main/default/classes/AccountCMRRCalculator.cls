/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
*
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* author:         ngoldy
* modifiedBy:     pdhingra
* created:        06/21/2021
* modified:       09/03/2025
* created jira:   BR-1834
* ──────────────────────────────────────────────────────────────────────────────────────────────────
*/
public class AccountCMRRCalculator {
	static final String DELIMITER = '||';
	// Static collection to track account IDs that failed due to row lock errors
	public static List<Id> failedAccountIds = new List<Id>();
	
	/**
	 * Returns list of account IDs that failed in the current transaction
	 * and clears the list for the next transaction
	 */
	public static List<Id> getFailedAccountIdsAndClearIt() {
		List<Id> returnIds = new List<Id>(failedAccountIds);
		failedAccountIds.clear(); // Reset for next batch
		return returnIds;
	}
	private static List<String> cmrrFields = new List<String> {
    	'Data_CMRR__c',
    	'Digital_Retail_CMRR__c',
    	'Display_CMRR__c',
		'Listings_Base_CMRR__c',
		'Listings_CMRR__c',
		'PistonHeads_CMRR__c',
		'Website_Inventory_CMRR__c',
		'Transactional_CMRR__c'
   		 // Total CMRR is a formula field on Account
  	};

	static Set<String> excludedTransactionProducts = new Set<String>{'SMCL-Block'};

  	public static void calculateAndUpdateCMRR(List<Account> accounts) {

		Map<String,List<String>> mrrFieldsPerCountryAndProductMap = new Map<String,List<String>>();

		for(MRR_Field_Eligibility_Matrix__mdt mrrEligibilityRecord : [
			SELECT Country_Code__c, Product_Family__c, Product_Category__c, Product_Subcategory__c, Data_CMRR__c, Display_CMRR__c,
			Digital_Retail_CMRR__c, Listings_Base_CMRR__c, Listings_CMRR__c, PistonHeads_CMRR__c, Website_Inventory_CMRR__c,
			Transactional_CMRR__c 
			FROM MRR_Field_Eligibility_Matrix__mdt
		]) {
				
			// build key for the map
			// US||Listings
			String key = mrrEligibilityRecord.Country_Code__c + DELIMITER + mrrEligibilityRecord.Product_Family__c;
			
			//replacing the zero-width space char in unicode form
			key = key.replaceAll('\u200b','');
			
			// If Product Family is not Pistonhead => US||Listings||Add on Services
			if(mrrEligibilityRecord.Product_Family__c != ConstantsUtil.PRODUCT_PISTONHEADS) {
				key = key + DELIMITER + mrrEligibilityRecord.Product_Category__c;
			}

			// If Product Category is not Core Listings and Family not PH, add subcategory to key
			// US||Listings||Add on Services||Area Boost
			if(mrrEligibilityRecord.Product_Category__c != ConstantsUtil.PRODUCT_CATEGORY_CORE 
				&& mrrEligibilityRecord.Product_Family__c != ConstantsUtil.PRODUCT_PISTONHEADS) {
				key = key + DELIMITER + mrrEligibilityRecord.Product_Subcategory__c;
			}

			for(String fieldName : cmrrFields) {
				if(mrrEligibilityRecord.get(fieldName) == true) {
					if(!mrrFieldsPerCountryAndProductMap.containsKey(key)) {
						mrrFieldsPerCountryAndProductMap.put(key, new List<String>());
					}
					mrrFieldsPerCountryAndProductMap.get(key).add(fieldName);
				}
			}
    	}

    	List<Id> accountIds = new List<Id>();
    	Map<Id,Map<String,SBQQ__Subscription__c>> activeSubsByAccountMap = new Map<Id,Map<String,SBQQ__Subscription__c>>();
		Set<Id> accountsWithActiveDigitalAds = new Set<Id>();
		Map<Id,String> accountsWithActiveCoreProduct = new Map<Id,String>();
    	for(Account a : accounts) {
      		accountIds.add(a.Id);

			// for each account: build a map of currently active subs (by product category / subcategory)
			for(SBQQ__Subscription__c sub : a.CPQ_Subscriptions_Fulfillment__r) {
				if(sub.Activation_Status__c == 'Activated' || sub.Activation_Status__c == 'Pending Activation' || sub.Activation_Status__c == 'Delinquent') {
					if(!activeSubsByAccountMap.containsKey(a.Id)) {
						activeSubsByAccountMap.put(a.Id, new Map<String,SBQQ__Subscription__c>());
					}
					String key = sub.SBQQ__Product__r.Product_Category__c == 'Core Products' ? sub.SBQQ__Product__r.Product_Category__c : sub.SBQQ__Product__r.Sub_Category__c;
					activeSubsByAccountMap.get(a.Id).put(key, sub);

					if(sub.SBQQ__product__r.Product_Category__c == 'Digital Advertising') {
						accountsWithActiveDigitalAds.add(sub.Fulfillment_Account__c);
					}
					if(sub.SBQQ__product__r.Product_Category__c == 'Core Products') {
						accountsWithActiveCoreProduct.put(a.Id,sub.SBQQ__ProductName__c);
					}
				}
			}
    	}

		// query the latest non-removal CG Base Bundle and any standalone bundles 
		// that qualify (57-day criteria), and build a map with them
		Map<Id,Id> activeBundlesMap = new Map<Id,Id>();
		List<SBQQ__Subscription__c> subs = [
			SELECT Id, CreatedDate, Fulfillment_Account__c, Fulfillment_Account__r.Cancellation_Effective_Date__c, 
				SBQQ__Contract__c, Cancellation_Effective_Date__c, SBQQ__TerminatedDate__c, Delinquent_Date__c
			FROM SBQQ__Subscription__c
			WHERE Fulfillment_Account__c != NULL AND Fulfillment_Account__c IN :accountIds AND SBQQ__Quantity__c > 0
				AND SBQQ__StartDate__c <= TODAY AND SBQQ__Contract__r.Contract_Amend_Override__c = false
				AND (
					((Cancellation_Effective_Date__c = NULL OR Cancellation_Effective_Date__c > TODAY) AND Activation_Status__c IN ('Activated', 'Pending Activation', 'Delinquent'))
						OR (Cancellation_Effective_Date__c != NULL AND Canceling_57_days__c > TODAY)
						OR (Fulfillment_Account__r.Product_Activation_Status__c = 'Canceling – 57 days' AND Canceling_57_days__c > TODAY)
						OR (Delinquent_Date__c != NULL)
				) 
			AND SBQQ__ProductName__c IN ('Standalone Bundle', 'CG Base Bundle')];

		// query: currently active bundles OR bundles that were active at the time of cancellation (either full or partial)
		for(SBQQ__Subscription__c sub : subs) {
			if(sub.SBQQ__TerminatedDate__c == null
				|| sub.SBQQ__TerminatedDate__c >= System.today()
				|| (sub.Cancellation_Effective_Date__c != null && sub.SBQQ__TerminatedDate__c == sub.Cancellation_Effective_Date__c.addDays(-1))
				|| (sub.Fulfillment_Account__r.Cancellation_Effective_Date__c != null && sub.SBQQ__TerminatedDate__c == sub.Fulfillment_Account__r.Cancellation_Effective_Date__c.addDays(-1))
			) {
				activeBundlesMap.put(sub.Id, sub.SBQQ__Contract__c);
			}
		}

		for(Account acc : accounts) {

			acc.Data_CMRR__c = 0;
			acc.Display_CMRR__c = 0;
			acc.Listings_CMRR__c = 0;
			acc.Listings_Base_CMRR__c = 0;
			acc.Website_Inventory_CMRR__c = 0;
			acc.Digital_Retail_CMRR__c = 0;
			acc.PistonHeads_CMRR__c = 0;
			acc.Transactional_CMRR__c = 0;
			acc.Active_Core_Listings_Product__c = 'No Active Core Listings Product';
			if(accountsWithActiveCoreProduct.containsKey(acc.Id)) {
				acc.Active_Core_Listings_Product__c =accountsWithActiveCoreProduct.get(acc.Id);
			}

			//DSS-984 - Exclude Former Customers from MRR calculation  Start
			
			//DSS-984 - Exclude Former Customers from MRR calculation End
			for(SBQQ__Subscription__c sub : acc.CPQ_Subscriptions_Fulfillment__r) {
				String billingCountryCode = acc.BillingCountryCode;
				String productFamily = sub.SBQQ__Product__r.Family;
				String productCategory = sub.SBQQ__Product__r.Product_Category__c;
				String productSubCategory = sub.SBQQ__Product__r.Sub_Category__c;
				String productCode = sub.SBQQ__Product__r.ProductCode;

				if(activeBundlesMap.containsKey(sub.SBQQ__RequiredById__c)) {
					
					// If Activation_Status__c = 'De-activated' -> potential removal to include in MRR count
					// Need to check if there's a product swap though. If so, it shouldn't count towards MRR
					Map<String, SBQQ__Subscription__c> activeSubsMap = activeSubsByAccountMap.get(acc.Id);
					String key = productCategory == 'Core Products' 
						? productCategory
						: productSubCategory;
			
					if(sub.Activation_Status__c == 'De-activated' && activeSubsByAccountMap.containsKey(acc.Id) && 
						(activeSubsMap.containsKey(key) || 
							(accountsWithActiveDigitalAds.contains(acc.Id) && productCategory == 'Digital Advertising'))
					) {
						continue;
					}
					if(sub.Delinquent_Date__c!=null && sub.Activation_Status__c!='Activated' && sub.Delinquent_Date__c< Date.today().addDays(-57)) {
						continue;
					}
					if(acc.type == 'Former Customer' && sub.Canceling_57_days__c != null && sub.Canceling_57_days__c < date.today()) {
						continue;//do not process further for former customers
					}

					//DSS-1704 Sell My Car Leads - Additional Blocks not factored into CGR 
					//because this product is billed in arrears and not an active subscription.
					if(excludedTransactionProducts.contains(productCode)){
						continue;
					}

					// build key using account country, and product family/category/subcategory
					String mrrKey;

					if(sub.SBQQ__Product__r.Source__c == ConstantsUtil.PRODUCT_PISTONHEADS) {
						// US||PistonHeads
						mrrKey = billingCountryCode + DELIMITER + ConstantsUtil.PRODUCT_PISTONHEADS;
					} else {
						// US||Listings||Core Products
						mrrKey = billingCountryCode + DELIMITER + productFamily + DELIMITER + productCategory;
						if(productCategory != ConstantsUtil.PRODUCT_CATEGORY_CORE) {
							// US||Featured
							mrrKey = mrrKey + DELIMITER + productSubCategory;
						}
					}
					//replacing the zero-width space char in unicode form
					mrrKey = mrrKey.replaceAll('\u200b','');
					
					if(mrrFieldsPerCountryAndProductMap.containsKey(mrrKey)) {
						for(String fieldName : mrrFieldsPerCountryAndProductMap.get(mrrKey)) {
							acc.put(fieldName, (Decimal)acc.get(fieldName) + sub.Commission_CGR_Payout__c);
						}
					}
				}
			}
		}
		// Use Database.update with allOrNone=false to allow partial success
		Database.SaveResult[] results = Database.update(accounts, false);
		
		// Process results to capture failed account IDs
		for(Integer i = 0; i < results.size(); i++) {
			if(!results[i].isSuccess()) {
				for(Database.Error err : results[i].getErrors()) {
					// Check if the failure is due to a row lock error
					if(err.getMessage().contains('unable to obtain exclusive access to this record') || 
					   err.getMessage().contains('unable to lock row')) {
						// Add the failed account ID to our list
						failedAccountIds.add(accounts[i].Id);
						System.debug('Row lock error on account: ' + accounts[i].Id);
					} else {
						// Log other errors
						System.debug('Error updating account ' + accounts[i].Id + ': ' + err.getMessage());
						// Create a log message with the account ID
						List<Sentry_LogMessage> logMessages = new List<Sentry_LogMessage>{
							new Sentry_LogMessage(Sentry_LogMessage.LEVEL_INFO, 'Account ID: ' + accounts[i].Id)
						};
						// Use DmlException as a concrete exception type
						Sentry.record('Account CMRR Update Error', new DmlException(err.getMessage()), logMessages);
					}
				}
			}
		}
	}
}