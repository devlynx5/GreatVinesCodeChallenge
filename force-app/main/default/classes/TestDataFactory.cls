/**
 * @description       :
 * @author            : Denzyl Evelyn
 * @group             :
 * @last modified on  : 06-09-2022
 * @last modified by  : Denzyl Evelyn
 **/
@isTest
public class TestDataFactory {
  public static List<Account> CreateBasicAccounts(Integer count, String Name) {
    List<Account> accountsList = new List<Account>();
    for (Integer i = 0; i < count; i++) {
      Account singleAccount = new Account(Name = 'Test ' + i);
      accountsList.add(singleAccount);
    }
    return accountsList;
  }
}
