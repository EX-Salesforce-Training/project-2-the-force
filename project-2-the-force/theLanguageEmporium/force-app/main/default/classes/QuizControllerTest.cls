@isTest
public class QuizControllerTest {
    @isTest
    static void scoreTest(){
        UserRole portalRole = [SELECT Id FROM UserRole WHERE PortalType = 'None' LIMIT 1];
        system.debug('PortalRole is ' + portalRole);
        
        Profile profile1 = [SELECT Id FROM Profile WHERE Name = 'System Administrator'];
        User portalAccountOwner1 = new User(
            UserRoleId = portalRole.Id,
            ProfileId = profile1.Id,
            Username = System.now().millisecond() + 'test2@test.com',
            Alias = 'Cap\'n',
            Email='janeway.kathryn@voyager.net',
            EmailEncodingKey='UTF-8',
            Firstname='Kathryn',
            Lastname='Janeway',
            LanguageLocaleKey='en_US',
            LocaleSidKey='en_US',
            TimeZoneSidKey='America/Chicago'
        );
        Database.insert(portalAccountOwner1);
        
        System.runAs ( portalAccountOwner1 ) {
            // create account
            Account portalAccount1 = new Account(
                Name = 'TestAccount',
                //email__c='kat@gmail.com',
                OwnerId = portalAccountOwner1.Id
            );
            Database.insert(portalAccount1);
            
            // create contact
            Contact contact1 = new Contact(
                FirstName = 'B\'Elanna',
                Lastname = 'Torres',
                AccountId = portalAccount1.Id,
                Total_Score__c = 0,
                Email = System.now().millisecond() + 'test47@test.com'
            );
            Database.insert(contact1);
            
            // create user
            Profile portalProfile = [SELECT Id FROM Profile WHERE Name = 'Custom-Learners'];
            User user1 = new User(
                Username = System.now().millisecond() + 'test47@test.com',
                ContactId = contact1.Id,
                ProfileId = portalProfile.Id,
                Alias = 'test47',
                Email = 'test47@test.com',
                EmailEncodingKey = 'UTF-8',
                LastName = 'McTesty',
                CommunityNickname = 'test47',
                TimeZoneSidKey = 'America/Los_Angeles',
                LocaleSidKey = 'en_US',
                LanguageLocaleKey = 'en_US'
            );
            Database.insert(user1);
            
            System.runAs(user1) {
                /*PageReference pageRef = Page.quiz;
				Test.setCurrentPage(pageRef);*/
                QuizController controller = new QuizController();
                controller.getQ1Items();
                controller.getQ2Items();
                controller.getQ3Items();
                controller.getQ4Items();
                controller.getQ5Items();
                controller.getQ6Items();
                controller.getQ7Items();
                controller.getQ8Items();
                
                controller.submit();
            }
        }
    }
    @isTest
    static void nullTest(){
        UserRole portalRole = [SELECT Id FROM UserRole WHERE PortalType = 'None' LIMIT 1];
        system.debug('PortalRole is ' + portalRole);
        
        Profile profile1 = [SELECT Id FROM Profile WHERE Name = 'System Administrator'];
        User portalAccountOwner1 = new User(
            UserRoleId = portalRole.Id,
            ProfileId = profile1.Id,
            Username = System.now().millisecond() + 'test2@test.com',
            Alias = 'Cap\'n',
            Email='janeway.kathryn@voyager.net',
            EmailEncodingKey='UTF-8',
            Firstname='Kathryn',
            Lastname='Janeway',
            LanguageLocaleKey='en_US',
            LocaleSidKey='en_US',
            TimeZoneSidKey='America/Chicago'
        );
        Database.insert(portalAccountOwner1);
        
        System.runAs ( portalAccountOwner1 ) {
            // create account
            Account portalAccount1 = new Account(
                Name = 'TestAccount',
                //email__c='kat@gmail.com',
                OwnerId = portalAccountOwner1.Id
            );
            Database.insert(portalAccount1);
            
            // create contact
            Contact contact1 = new Contact(
                FirstName = 'B\'Elanna',
                Lastname = 'Torres',
                AccountId = portalAccount1.Id,
                Total_Score__c = null,
                Email = System.now().millisecond() + 'test47@test.com'
            );
            Database.insert(contact1);
            
            // create user
            Profile portalProfile = [SELECT Id FROM Profile WHERE Name = 'Custom-Learners'];
            User user1 = new User(
                Username = System.now().millisecond() + 'test47@test.com',
                ContactId = contact1.Id,
                ProfileId = portalProfile.Id,
                Alias = 'test47',
                Email = 'test47@test.com',
                EmailEncodingKey = 'UTF-8',
                LastName = 'Torres',
                CommunityNickname = 'test47',
                TimeZoneSidKey = 'America/Los_Angeles',
                LocaleSidKey = 'en_US',
                LanguageLocaleKey = 'en_US'
            );
            Database.insert(user1);
            
            System.runAs(user1) {
                /*PageReference pageRef = Page.quiz;
				Test.setCurrentPage(pageRef);*/
                
                QuizController controller = new QuizController();
                controller.getQ1Items();
                controller.getQ2Items();
                controller.getQ3Items();
                controller.getQ4Items();
                controller.getQ5Items();
                controller.getQ6Items();
                controller.getQ7Items();
                controller.getQ8Items();
                
                controller.submit();
            }
        }
    }
}