@isTest
public class RecruitingWizardTest {
    @isTest
    public static void positionsArePopulated(){
        List<Position__c> positions = new List<Position__c>();
        Schema.DescribeFieldResult devTeams = Position__c.Course_Dev_Team__c.getDescribe();
        List<Schema.PicklistEntry> devTeamEntry = devTeams.getPicklistValues();
        
        for(Integer i = 0; i < 30; i++){
            Integer j = math.mod(i, devTeamEntry.size());
            Position__c testPosition = new Position__c(Name='Test'+i, Course_Dev_Team__c = devTeamEntry[j].value, status__c='Open');
        	positions.add(testPosition);
        }
        
        insert positions;
        
        RecruitingWizard controller = new RecruitingWizard();
        
        system.assertEquals(controller.positions.size(), positions.size());
        system.assert(controller.education.size() == 1);
        system.assert(controller.experience.size() == 3);
        system.assert(controller.pickedPosition == null);
      	system.assert(controller.AnswerWrappers.isEmpty());
    }
    
    @isTest
    public static void recruitingLandingClearsPickedPosition(){
        Position__c test = new Position__c(Name='ContentDev', Course_Dev_Team__c = 'Japanese');
    	
        insert test;
        
        RecruitingWizard controller = new RecruitingWizard();
        
        controller.pickedPosition = test;
        
        controller.recruitingLanding();
        
        system.assert(controller.pickedPosition == null);
    }
    
    @isTest
    public static void recruitingLandingReturnsPage(){
        PageReference pr = Page.PositionPage;
        Test.setCurrentPage(pr);
        
        RecruitingWizard controller = new RecruitingWizard();
        String nextPage = controller.recruitingLanding().getURL();
        
        System.assertEquals('/apex/recruitinglanding', nextPage);
        
    }
    
    @isTest
    public static void positionPageReturnsCorrectPage(){
        Position__c pickedPosition = new Position__c(Name='ContentDev', Course_Dev_Team__c = 'Japanese');
        insert pickedPosition;
        
        PageReference pr = Page.RecruitingLanding;
        
        Test.setCurrentPage(pr);
        
        pr.getParameters().put('position', pickedPosition.id);        
        
        RecruitingWizard controller = new RecruitingWizard();
       	
        String nextPage = controller.positionPage().getURL();
        
        System.assertEquals('/apex/positionpage', nextPage);
        System.assertEquals(controller.pickedPosition.id, pickedPosition.id);
        
    }
    
    @isTest
    public static void returnCandidatePage(){
        PageReference pr = Page.PositionPage;
        Test.setCurrentPage(pr);
        
        RecruitingWizard controller = new RecruitingWizard();
        String nextPage = controller.candidatePage().getURL();
        
        System.assertEquals('/apex/candidatepage', nextPage);
        
    }
    
    @isTest
    public static void returnExperience(){
        PageReference pr = Page.candidatePage;
        Test.setCurrentPage(pr);
        
        RecruitingWizard controller = new RecruitingWizard();
        String nextPage = controller.experience().getURL();
        
        System.assertEquals('/apex/experience', nextPage);
    }
    
    @isTest
    public static void returnCandidateQuestions(){
        Position__c pickedPosition = new Position__c(Name='ContentDev', Course_Dev_Team__c = 'Japanese');
        insert pickedPosition;
        
        List<Position_Question__C>questions = new List<Position_Question__c>();
        
        for(Integer i = 0; i < 3; i++){
            Position_Question__c newQuestion = new Position_Question__c(Position__C=pickedPosition.id, question__c='test');
            questions.add(newQuestion);
        }
        
        insert questions;
        
        pickedPosition = [SELECT Name, Description__c, Course_Dev_Team__c, Type__c, (SELECT Question__c FROM Position_Questions__r) from Position__c Where id = :pickedPosition.Id];
        PageReference pr = Page.experience;
        Test.setCurrentPage(pr);
        system.assertEquals(3, pickedPosition.Position_Questions__r.size());
        RecruitingWizard controller = new RecruitingWizard();
        controller.pickedPosition = pickedPosition;
        String nextPage = controller.candidateQuestions().getURL();
        
        System.assertEquals('/apex/candidatequestions', nextPage);
        System.assertEquals(3, controller.answers.size());
        System.assertEquals(3, controller.answerWrappers.size());
    }
    
    @isTest
    public static void returnDemographic(){
        PageReference pr = Page.Experience;
        Test.setCurrentPage(pr);
        
        RecruitingWizard controller = new RecruitingWizard();
        String nextPage = controller.demographic().getURL();
        
        System.assertEquals('/apex/demographic', nextPage);
    }
    
     @isTest
    public static void returnReview(){
        PageReference pr = Page.Demographic;
        Test.setCurrentPage(pr);
        
        RecruitingWizard controller = new RecruitingWizard();
        String nextPage = controller.review().getURL();
        
        System.assertEquals('/apex/resumereview', nextPage);
    }
    
    @istest 
    public static void EducationIsAdded(){
    	
        RecruitingWizard controller = new RecruitingWizard();
        system.assertEquals(1, controller.education.size());
		controller.addEd();
        System.assertEquals(2, controller.education.size());
        
        controller = new RecruitingWizard();
        for(Integer i = 0; i < 4; i++){
            controller.addEd();
        }
        
        System.assertEquals(3, controller.education.size());
        
    }
    @isTest
     public static void EducationIsRemoved(){
    	
        RecruitingWizard controller = new RecruitingWizard();
        controller.addEd();
        System.assert(controller.education.size() == 2);
        controller.remEd();
        System.assertEquals(1, controller.education.size());
        controller.remEd();
        System.assertEquals(1, controller.education.size());
        
    }
     @istest 
    public static void ExperienceIsAdded(){
    	
        RecruitingWizard controller = new RecruitingWizard();
        system.assertEquals(3, controller.experience.size());
		controller.addExp();
        System.assertEquals(4, controller.experience.size());
        
        controller = new RecruitingWizard();
        for(Integer i = 0; i < 6; i++){
            controller.addExp();
        }
        
        System.assertEquals(5, controller.experience.size());
        
    }
    @isTest
     public static void ExperienceIsRemoved(){
    	
        RecruitingWizard controller = new RecruitingWizard();
        controller.addExp();
        System.assert(controller.experience.size() == 4);
        controller.remExp();
        System.assertEquals(3, controller.experience.size());
       	
        controller = new RecruitingWizard();
        for(Integer i = 0; i < 3; i++){
            controller.remExp();
        }
        
        System.assertEquals(1, controller.experience.size());
    }
    
    @isTest
    public static void answerWrapperTest(){
        
        Candidate_Answer__c answer = new Candidate_Answer__c(Answer__c = 'Test');
        Position_Question__c question = new Position_Question__c(Question__c = 'Test');
        
        RecruitingWizard controller = new RecruitingWizard();
        
        AnswerWrapper wrapper = new AnswerWrapper(question, answer);
        
       	System.assertEquals('Test', wrapper.answer.Answer__c);
        System.assertEquals('Test', wrapper.question.Question__c);
    }
    
    @isTest
    public static void submitSuccessTest(){
        
        PageReference pr = Page.Experience;
        Test.setCurrentPage(pr);
         
        RecruitingWizard controller = new RecruitingWizard();
        
		Position__c testPosition = new Position__c(Name='ContentDev', Course_Dev_Team__c = 'Japanese');
		 
		insert testPosition;
        
        controller.pickedPositionId = testPosition.id;
        
        controller.positionCandidate = new Candidate__c(first_Name__c='Test', last_Name__c='test', Country__c = 'Test', Education__c = 'BA/BS', email__c='test@test.com', phone__c='(603)305-5707', State_Province__c='test', US_Citizen__c = true, Zip_Postal_Code__c='Test');
        
        List<Candidate_Experience__c> experience = new List<Candidate_Experience__C>();
        
        for(Integer i = 0; i < 5; i++){
            Candidate_Experience__c testExperience = new Candidate_Experience__c(Address__c = 'Test', 
                                                                                 Company_Name__c='Test', 
                                                                                 Company_Phone__c='(555)555-5555', 
                                                                                 Description__c='Test', 
                                                                                 Reported_To__c = 'test', 
                                                                                 Start_Date__c = Date.today(), 
                                                                                 End_Date__c=Date.today()
                                                                                );   
        	experience.add(testExperience);
        } 
        
        controller.experience = experience;
        
        controller.education = new List<Candidate_Education__C>{new Candidate_Education__c(Date_of_Graduation__c = Date.today(), 
                                                                                           Date_Started__c = Date.today(), 
                                                                                           Degree__c = 'BA/BS', 
                                                                                           Graduated__c = true, 
                                                                                           School__c = 'Test' )};
        
        Position_Question__c question = new Position_Question__c(Position__c = testPosition.id, Question__c = 'Test');
        
        insert question;
        
        controller.answers = new List<Candidate_Answer__c>{new Candidate_Answer__c(Answer__c='Test', Position_Question__c = question.id)};
		
        controller.pickedPosition = testPosition;
		
        
		Test.startTest();
			String nextPage = controller.submit().getURL();
		Test.stopTest();

		System.assertEquals('/apex/candidatesuccess', nextPage);
        System.assert(controller.candidateApplication.id != null);
        System.assert(controller.positionCandidate.id != null);
        System.assert(controller.positionDem.id != null);
    }
    
    @isTest
    public static void ReturnFailure(){
        RecruitingWizard controller = new RecruitingWizard();
        
		PageReference pr = Page.ResumeReview;
        Test.setCurrentPage(pr);
		
		String nextPage = controller.submit().getUrl();
        
        System.assertEquals('/apex/candidatefailure', nextPage);
    }
    
    
}