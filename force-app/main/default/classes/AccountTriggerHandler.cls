/**
 * @description       : AccountTriggerHandler to handle business logic for different scenarios on the account
 * @author            : Denzyl Evelyn
 * @group             :
 * @last modified on  : 06-09-2022
 * @last modified by  : Denzyl Evelyn
 **/
public with sharing class AccountTriggerHandler {
  private static AccountSelector accountSelector = new AccountSelector();
  /**
   * @description : Create child account when Parent status is set to cold
   * @author Denzyl Evelyn | 06-09-2022
   * @param updatedAccount
   **/
  public static void createChildAccount(Map<Id, Account> updatedAccount) {
    // created a list of accounts to perform the mass update
    list<Account> accountsToUpdate = new List<Account>();

    // SOQL forloop to get all the accounts that have parent status as cold
    for (Account record : accountSelector.getAccount(updatedAccount.keySet()))
      if (record.Rating == 'Cold') {
        // single child account
        Account childAccount = new Account();
        childAccount.Name = record.Name;
        childAccount.Rating = record.Rating;
        childAccount.ParentId = record.Id;

        // add the child account to the list of accounts to update
        accountsToUpdate.add(childAccount);
      }
    if (accountsToUpdate.size() > 0) {
      SObjectAccessDecision securityDecision = Security.stripInaccessible(
        AccessType.CREATABLE,
        accountsToUpdate
      );
      insert securityDecision.getRecords();
    }
  }
}
