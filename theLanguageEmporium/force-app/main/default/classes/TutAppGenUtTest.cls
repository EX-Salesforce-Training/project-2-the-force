@isTest
public class TutAppGenUtTest {
    
    public static List<Tutor_Application__c> GenerateAppies(Integer numApp, String Name) {
        List<Tutor_Application__c> gendApp = new List<Tutor_Application__c>();
        
        for(Integer i = 0; i < numApp; i++) {
            Tutor_Application__c tA = new Tutor_Application__c();
            tA.Date_Opened__c = system.today();
            tA.Learner_Since__c = system.today();
            tA.Learner_Account__c = '0015Y00002h80B2QAI';
            tA.Status__c = 'New';
            gendApp.add(tA);
        }
        
        return gendApp;
    }
    
}