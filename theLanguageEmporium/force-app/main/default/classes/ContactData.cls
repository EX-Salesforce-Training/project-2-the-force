public without sharing class ContactData {
    
    @AuraEnabled
    public static user fetchUser(){
    // query current user information  
     User oUser = [select id,Country,Email,FirstName,LastName, Phone FROM User Where id =:userInfo.getUserId()];
    return oUser;
    }

    // @AuraEnabled
    // public static list<Course__c> getCourseList(Id contactId)
    // {   
    //     List<Course__c> Courselist = [Select Course_ID__c, name FROM Course__c];
    //     return Courselist;
    // } 

    @AuraEnabled
    public static list<Learner_Access__c> getLearnerAccess(Id contactId)
    {   
        List<Learner_Access__c> Courselist = [Select Course__c FROM Learner_Access__c WHERE Learner__c = :contactId];
        return Courselist;
    } 
}
   

