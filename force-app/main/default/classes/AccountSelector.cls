/**
 * @description       : Selector class to run a soql query and return the results of the collection passed
 * @author            : Denzyl Evelyn
 * @group             : 
 * @last modified on  : 06-09-2022
 * @last modified by  : Denzyl Evelyn
**/
public with sharing class AccountSelector {
    /**
    * @description : SOQL query to select the accounts in a collection variable
    * @author Denzyl Evelyn | 06-09-2022 
    * @param ids 
    * @return List<Case> 
    **/
    public List<Account> getAccount(Set<Id> ids) {
    return [
      SELECT Id, Name,Rating FROM Account WHERE Id IN :ids WITH SECURITY_ENFORCED];
    }
}
