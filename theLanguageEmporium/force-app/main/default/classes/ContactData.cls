public with sharing class ContactData {
    
    @AuraEnabled
    public static user fetchUser(){
     // query current user information  
      User oUser = [select id,Country,Email,FirstName,LastName FROM User Where id =: userInfo.getUserId()];
        return oUser;
    }
}
   

/*@AuraEnabled
    public static list<Course__c> getCourseList(Id recordId)
    {
        List<Course__c> Courselist = [Select Course_ID__c, name FROM Course__c];
        return Courselist;
    } */