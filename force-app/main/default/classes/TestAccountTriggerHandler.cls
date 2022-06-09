/**
 * @description       : Test class for Account Trigger Handler
 * @author            : Denzyl Evelyn
 * @group             :
 * @last modified on  : 06-09-2022
 * @last modified by  : Denzyl Evelyn
 **/
@istest
public class TestAccountTriggerHandler {
  @TestSetup
  static void makeData() {
    // Insert a person account
    List<Account> accountList = TestDataFactory.CreateBasicAccounts(
      300,
      'TestAccount'
    );
    insert accountList;
  }

  /**
   * @description : Test Methods to assert accounts are created when the parent is set to Cold
   * @author Denzyl Evelyn | 06-09-2022
   **/
  @isTest
  public static void shouldCreateChildAccount() {
    List<Account> accounts = new List<Account>();

    for (Account record : [SELECT ID, Name, Rating FROM Account]) {
      record.Rating = 'Cold';

      accounts.add(record);
    }
    SObjectAccessDecision securityDecision = Security.stripInaccessible(
      AccessType.CREATABLE,
      accounts
    );
    insert securityDecision.getRecords();

    System.assertEquals(
      300,
      securityDecision.getRecords().size(),
      'Accounts were not created'
    );
  }
}
