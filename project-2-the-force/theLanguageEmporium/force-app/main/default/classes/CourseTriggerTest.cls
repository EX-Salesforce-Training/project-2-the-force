////////////////////////////////////////////////////
//
// Name: CourseTriggerTest
// Author: David J. Sellinger
// Created: 2021-04-08
// Updated: 2021-04-20
// Description: Testing the CourseTrigger.
// 		
//
////////////////////////////////////////////////////

@IsTest(SeeAllData=true)
public class CourseTriggerTest {
    
    @IsTest
    static void SinglePositiveTest() {
        
        // Create a single Course record with the required fields
        // Attempt to insert it into the database and save the result
        Test.startTest();
        List<Course__c> insertCourses = CourseGenUtilityTest.GenerateCourses(1, 'SingleTest');
        List<Database.SaveResult> results = Database.insert(insertCourses, false);
        Test.stopTest();
        Integer numFailed = 0;
                
        // Test Course record insert
        for (Database.SaveResult sr: results) {
            if(!sr.isSuccess()) {
                numFailed += 1;
            }
        }
        
        System.assertEquals(0, numFailed);
        
        List<Task> taskResult = [SELECT Subject FROM Task WHERE Subject LIKE '%SingleTest%'];
        System.assertNotEquals(0, taskResult.size());
        
    }
    
    @isTest
    static void NegativeSingleTest() {
        // Create a single Order record missing required fields
        String recordID = Schema.SObjectType.Course__c.getRecordTypeInfosByName().get('Course').getRecordTypeId();
        Course__c l = new Course__c();
        l.RecordTypeId = recordID;
        
        // Test Course record insert
        Database.SaveResult results = Database.insert(l, false);
        Integer numSuccess = 0;
        if(results.isSuccess()) {
            numSuccess += 1;
        }
        
        System.assertEquals(0, numSuccess);
        
        List<Task> taskResult = [SELECT Subject FROM Task WHERE Subject LIKE '%SingleTest%'];
        System.assertEquals(0, taskResult.size());
     
    }
    
    @isTest
    static void BulkTest() {
        
        // Create mass Course records with the required fields
        // Attempt to insert it into the database and save the result
        List<Database.SaveResult> results = Database.insert(CourseGenUtilityTest.GenerateCourses(200, 'Bulktest'), false);
        Integer numFailed = 0;
        
        // Check if the operation has failed and update variable
        for (Database.SaveResult sr: results) {
            if(!sr.isSuccess()){
                numFailed += 1;
            }
        }
        
        List<Task> taskResult = [SELECT Subject FROM Task WHERE Subject LIKE '%BulkTest%'];
        System.assertNotEquals(0, taskResult.size());
        
        // Assert error if operation has failed
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
                
                String recordID = '0125Y000001b9aDQAQ';
                Course__c l = new Course__c();
                l.Name = 'Bobitha';
                l.RecordTypeId = recordID;
                l.Status__c = 'New';
                insert l;
            } Catch(exception e) {
                System.assert (true);
                System.debug('Ruh roh!');
            }
        }
    }
}