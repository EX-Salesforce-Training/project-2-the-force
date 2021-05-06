public class learnerController {
   	public User currentUser {get;set;}
    public Contact currentContact {get;set;}
    public List<Session__c> sessions {get;set;}
   // public List<Course__c> courses {get;set;}
    public List<Lesson__c> lessons {get;set;}
    public List<Tutor__c> tutors {get;set;}
    public Session__c newSession {get;set;}
    
 
    public learnerController(){
        currentUser = [SELECT Id, ContactId FROM User WHERE id=:userinfo.getuserid() LIMIT 1];
        currentContact=[SELECT id, name, email, phone, Learner_Since__c,Last_Completed_Course__c, Current_Course__c, Current_Lesson__c
                        FROM Contact WHERE id = :currentUser.ContactId LIMIT 1];
       	sessions = [SELECT tutor__c, Language__c, Duration__c, date__c FROM Session__c  ];
        lessons = [SELECT name, course__c, Lesson_Number__c, Language_s__c, Completion_status__c
                  FROM Lesson__c where id= :currentContact.Current_Lesson__c];
        tutors = [SELECT name, email__c, language__c FROM Tutor__c WHERE learner_account__c = :currentContact.id];
    	//newSession.learner__c = currentContact.id;
    	this.newSession = new Session__c(learner__c = currentContact.id);
       
    }
    
    public PageReference getNewSession(){
   		//PageReference pr = new PageReference('/apex/Session');
   		PageReference newSession = Page.Session;
        newSession.setRedirect(true);
   		return newSession;
	}
    public pageReference saveSession(){
        insert newSession;
       	//PageReference bookedSession = Page.Session;
       // bookedSession.setRedirect(true);
   		return Page.BookedLesson;
    }
  
    public PageReference returnToLearnerPage(){
   		//PageReference pr = new PageReference('/apex/Session');
   		//PageReference learnerPage = Page.Session;
        //learnerPage.setRedirect(true);
    
   		return Page.learner;
	}
    

}