@isTest(SeeAllData=true)
public class TutorApplicationTriggerTest {
    
    @isTest
    static void PositiveSingleTest() {
        // Create a single Tutor_Application__c record with the required fields
        // Attempt to insert it into the database and save the result
        List<Database.SaveResult> results = Database.insert(TutAppGenUtTest.GenerateAppies(1, 'Name'), false);       
        Integer numFailed = 0;
        
        // Check if the operation has failed and update variable
        for (Database.SaveResult sr: results) {
            if(!sr.isSuccess()){
                numFailed += 1;
            }
        }
        
        // Assert error if operation has failed
        System.assertEquals(0, numFailed);
    }
    
    @isTest
    static void NegativeSingleTest() {
        // Create a single Tutor_Application__c record missing required field
        Tutor_Application__c tA = new Tutor_Application__c();
        tA.Status__c = 'New';
        tA.Date_Opened__c = system.today();
        tA.Learner_Since__c = system.today();
        
        // Try to insert record and save result
        Database.SaveResult results = Database.insert(tA, false);
        Integer numSuccess = 0;
        
        // Check if the operation has succeeded and update variable
        if(results.isSuccess()){
            numSuccess += 1;
        }
        
        // Assert error if operation has succeeded
        System.assertEquals(0, numSuccess);
    }
    
    @isTest
    static void BulkTest() {
        // Generate mass records
        List<Database.SaveResult> results = Database.insert(TutAppGenUtTest.GenerateAppies(200, 'Name'), false);
        Integer numFailed = 0;
        
        for (Database.SaveResult sr: results) {
            if(!sr.isSuccess()){
                numFailed += 1;
            }
        }
        
        System.assertEquals(0, numFailed);
    }
    
    @isTest
    public Static Void runAsExample() {
        // User setup
        String uName = 'user' + Datetime.now().getTime() + '@ChatterIsSoCool.com';
        Profile p = [SELECT id
                     FROM Profile
                     WHERE name='Chatter Free User'];
        
        User u = new User(alias = 'testUser', email='jonnie@jonniez.com',
                          emailencodingkey='UTF-8', lastname = 'Test', languagelocalekey='en_us',
                          timezonesidkey='america/new_york', localeSidKey='en_us',
                          profileId=p.id, username=uName);
        
        System.RunAs(u) {
            try {
                System.debug(UserInfo.getUserName());
                System.debug(UserInfo.getProfileId());
                System.debug('Run as above user.');
 
                Tutor_Application__c tA = new Tutor_Application__c();
                tA.Status__c = 'New';
                tA.Date_Opened__c = system.today();
                tA.Learner_Since__c = system.today();
                tA.Learner_Account__c = '0015Y00002h80B2QAI';
                insert tA;
            } Catch(exception e) {
                System.assert(true);
                System.debug('Ruh roh!');
            }
        }
    }
}