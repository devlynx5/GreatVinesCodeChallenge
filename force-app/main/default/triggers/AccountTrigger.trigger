/**
 * @description       : Trigger on Account Trigger
 * @author            : Denzyl Evelyn
 * @group             : 
 * @last modified on  : 06-09-2022
 * @last modified by  : Denzyl Evelyn
**/
trigger AccountTrigger on Account (after update,before update) {

    // call after update method
    if(Trigger.isAfter && Trigger.isUpdate){
        AccountTriggerHandler.createChildAccount(Trigger.newMap);
    }
}