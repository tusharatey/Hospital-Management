trigger CreateFollowupAfterPatientInsert on New_Patient__c (after insert) {
    if(Trigger.isInsert){
        List<FollowUps__c> flp = new List<FollowUps__c>();
        for(New_Patient__c pt : Trigger.New){
    FollowUps__c followup = new FollowUps__c(Patient_ID__c = pt.Name , Title__c=pt.Title__c,Age__c=pt.Age__c,Name__c=pt.Name1__c);
            flp.add(followup);
        }
        insert flp;
    }
}