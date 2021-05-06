@isTest
public class learnerControllerTest{
 	
  @isTest public static void learnerTest(){
		UserRole portalRole = [Select Id From UserRole Where PortalType = 'None' Limit 1];
		system.debug('portalRole is ' + portalRole);
	
        Profile profile1 = [Select Id from Profile where name = 'System Administrator'];
        User portalAccountOwner1 = new User(
        UserRoleId = portalRole.Id,
        ProfileId = profile1.Id,
        Username = System.now().millisecond() + 'test2@test.com',
        Alias = 'batman',
        Email='bruce.wayne@wayneenterprises.com',
        EmailEncodingKey='UTF-8',
        Firstname='Bruce',
        Lastname='Wayne',
        LanguageLocaleKey='en_US',
        LocaleSidKey='en_US',
        TimeZoneSidKey='America/Chicago'
        );
        Database.insert(portalAccountOwner1);
        
        //User u1 = [Select ID From User Where Id =: portalAccountOwner1.Id];
        
        System.runAs ( portalAccountOwner1 ) {
        //Create account
        Account portalAccount1 = new Account(
        Name = 'TestAccount',
        OwnerId = portalAccountOwner1.Id,
        email__c='batman@gmail.com'
        );
        Database.insert(portalAccount1);
        //Create contact
        Contact contact1 = new Contact(
        FirstName = 'Test',
        Lastname = 'McTesty',
        AccountId = portalAccount1.Id,
        Email = System.now().millisecond() + 'test@test.com'
        );
        Database.insert(contact1);
        
        //Create user
        Profile portalProfile = [SELECT Id FROM Profile WHERE name ='Learner'];
        User user1 = new User(
        //Username = System.now().millisecond() + 'test12345@test.com',
        Username = 'test12345@test.com',
        ContactId = contact1.Id,
        ProfileId = portalProfile.Id,
        Alias = 'test123',
        Email = 'test12345@test.com',
        EmailEncodingKey = 'UTF-8',
        LastName = 'McTesty',
        CommunityNickname = 'test12345',
        TimeZoneSidKey = 'America/Los_Angeles',
        LocaleSidKey = 'en_US',
        LanguageLocaleKey = 'en_US'
        );
        Database.insert(user1);
         Tutor__c newTutor = new Tutor__c();
        	newTutor.Email__c='tutor@gmail.com';
       	 	newTutor.Language__c='English';
        	newTutor.Qualifications__c ='School';
            newTutor.Learner_Account__c=user1.contactID;
            insert newTutor;
            User u = [SELECT contactID from User WHERE Username = 'test12345@test.com'];
            /**
            Session__c newSession = new Session__c();
        	newSession.Tutor__c = newTutor.id;
        	newSession.Duration__c=1;
        	newSession.Language__c='Spanish';
        	newSession.Date__c = System.today();
            newSession.Learner__c= u.contactID;**/
        System.runAs(user1){
            
            //Create Session Page 
            PageReference pageref = new PageReference('learner');
            Test.setCurrentPage(pageref);
            learnerController controller = new learnerController();
            String newSessionURL =controller.getNewSession().getURL();
            System.assertEquals('/apex/session', newSessionURL);
            
             //Booked Page 
            PageReference pagerefSession = new PageReference('session');
            Test.setCurrentPage(pagerefSession);
            //learnerController controller2 = new learnerController();
            String BookedURL =controller.returnToLearnerPage().getURL();
            System.assertEquals('/apex/learner', BookedURL);
            
            //Book Lesson Page
           // PageReference pagerefSession = new PageReference('session');
            Test.setCurrentPage(pagerefSession);
           // learnerController controller1 = new learnerController();
           
        	controller.newSession.Tutor__c = newTutor.id;
        	controller.newSession.Duration__c=1;
        	controller.newSession.Language__c='Spanish';
        	controller.newSession.Date__c = System.today();
           	
       		
            
            String SessionURL =controller.saveSession().getURL();
          
            System.assertEquals('/apex/bookedlesson', SessionURL);
            
           
            
			            
                }    
            
        }
        }

        }