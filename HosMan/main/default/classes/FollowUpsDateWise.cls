public with sharing class FollowUpsDateWise {
    @AuraEnabled(cacheable=true)
    public static List<FollowUps__c> searchFollow(Date searchTerm) {
       
        return [SELECT Id,Patient_ID__c,Name,Sex__c,Email_ID__c,FollowUp_Date__c,Consultant__r.name,FollowUp__c,Mobile_No__c FROM FollowUps__c WHERE FollowUp_Date__c = :searchTerm];
    }
}