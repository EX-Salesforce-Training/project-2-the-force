public class QuizController {
    //------ QUIZ QUESTIONS ------//
    public String q1{get;set;}
    public String q2{get;set;}
    public String q3{get;set;}
    public String q4{get;set;}
    public String q5{get;set;}
    public String q6{get;set;}
    public String q7{get;set;}
    public String q8{get;set;}
    
    //------ QUIZ VALUES ------//
    Public Integer score{get;set;}
    Public Double correct{get;set;}
    Public Integer fin{get;set;}
    public Integer incorrect{get;set;}
    public Double percentage{get;set;}
    
    //------ USER VALUES ------//
    public String userName{get;set;}
    public String nickName{get;set;}
    public String currUserId{get;set;}
    public Decimal prevRank{get;set;}
    public Decimal currRank{get;set;}
    public Decimal totalScore{get;set;}
    public Decimal lastQuiz{get;set;}
    
    //------ CONSTRUCTOR ------//
    public quizController() {        
        String userID = String.valueOf(UserInfo.getUserId());
        User user = [SELECT Id, ContactId, CommunityNickname FROM User WHERE Id = :userID];
        
        currUserId = user.ContactId;
        nickName = user.CommunityNickname;
        String conID = String.valueOf(user.ContactId);
        
        Contact currUserCon = [SELECT Id, Name, Total_Score__c, Last_Quiz__c, (SELECT Username FROM Users) FROM Contact WHERE Id = :conID];
        totalScore = currUserCon.Total_Score__c;
        
        if (totalScore == null) {
            totalScore = 0;
            lastQuiz = 0;
            currRank = 0;
            prevRank = 0;
            userName = currUserCon.Users[0].Username;
        } else {
            lastQuiz = currUserCon.Last_Quiz__c;
            userName = currUserCon.Users[0].Username;
            
            // set user's previous rank
            AggregateResult[] rankResult = [SELECT COUNT(Id) rank FROM Contact WHERE Total_Score__c > :totalScore];
            Decimal higherCount = (Decimal)rankResult[0].get('rank');
            prevRank = higherCount + 1;
        }
    }
    
    public PageReference submit() {
        //------ QUIZ ------//
        // grade quiz
        correct = 0;
        if (q1 == 'GEFALLEN') correct += 1;
        if (q2 == 'KUESST') correct += 1;
        if (q3 == 'GEHT') correct += 1;
        if (q4 == 'FLUSS') correct += 1;
        if (q5 == 'SCHNELL') correct += 1;
        if (q6 == 'TOETET') correct += 1;
        if (q7 == 'SICHER') correct += 1;
        if (q8 == 'BEZAHLT') correct += 1;
        fin = (Integer)correct;
        
        // calculate scores
        score = fin * 10000;
        incorrect = 8 - fin;
        percentage = correct / 8 * 100;
        
        //------ DATABASE ------//
        // create update objects
        Contact updateUser = new Contact();
        Quiz_Data__c insertData = new Quiz_Data__c();
        insertData.Learner__c = currUserID; // Associate Quiz_Data__c with current user
        insertData.Quiz_Name__c = 'GER 101 - Final Quiz';
        insertData.User_Nickname__c = nickName;
        
        // set user's total score
        updateUser.Id = currUserId; 
        totalScore += score;
        updateUser.Total_Score__c = totalScore;
        
        // set user's current rank
        AggregateResult[] rankResult = [SELECT COUNT(Id) rank FROM Contact WHERE Total_Score__c > :updateUser.Total_Score__c];
        Decimal higherCount = (Decimal)rankResult[0].get('rank');
        currRank = higherCount + 1;
        
        // set user's last quiz + date
        insertData.Quiz_Score__c = score;
        insertData.Quiz_Date__c = System.now();
        updateUser.Last_Quiz__c = score;
        updateUser.Last_Quiz_Date__c = System.now();
        
        // update user's values in database
        try {
            update updateUser;
            insert insertData;
        } catch(DmlException e) {
            System.debug('The following exception has occurred: ' + e.getMessage());
        }
        
        //------ RESULTS SCREEN ------//
        return Page.quizResults;
    }
    
    //------ QUIZ QUESTION OPTIONS ------//
    public List<SelectOption> getQ1Items() {
        list<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('GEFIELEN','gefielen'));
        options.add(new SelectOption('GEFALLEN','gefallen'));
        options.add(new SelectOption('FALLEN','fallen'));
        options.add(new SelectOption('GEFAELLT','gefällt'));
        return options;
    }
    
    public List<SelectOption> getQ2Items() {
        list<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('KUESSE','küsse'));
        options.add(new SelectOption('KUESSEN','küssen'));
        options.add(new SelectOption('KUESST','küsst'));
        options.add(new SelectOption('GEKUESST','geküsst'));
        return options;
    }
    
    public List<SelectOption> getQ3Items() {
        list<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('GINGE','ginge'));
        options.add(new SelectOption('GEHST','gehst'));
        options.add(new SelectOption('GEHT','geht'));
        options.add(new SelectOption('GEHEN','gehen'));
        return options;
    }
    
    public List<SelectOption> getQ4Items() {
        list<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('FLUSS','Fluss'));
        options.add(new SelectOption('KREIDE','Kreide'));
        options.add(new SelectOption('MEER','Meer'));
        options.add(new SelectOption('KIND','Kind'));
        return options;
    }
    
    public List<SelectOption> getQ5Items() {
        list<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('TRAURIG','traurig'));
        options.add(new SelectOption('SCHNELL','schnell'));
        options.add(new SelectOption('APFELMUS','Apfelmus'));
        options.add(new SelectOption('SINKEN','sinken'));
        return options;
    }
    
    public List<SelectOption> getQ6Items() {
        list<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('TOETET','tötet'));
        options.add(new SelectOption('LAEUFT','läuft'));
        options.add(new SelectOption('IST','ist'));
        options.add(new SelectOption('BIENE','Biene'));
        return options;
    }
    
    public List<SelectOption> getQ7Items() {
        list<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('DUMM','dumm'));
        options.add(new SelectOption('FAUL','faul'));
        options.add(new SelectOption('SICHER','sicher'));
        options.add(new SelectOption('UNTERWASSERKORBFLECHTEN','Unterwasserkorbflechten'));
        return options;
    }
    
    public List<SelectOption> getQ8Items() {
        list<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('BEZAHLT','bezahlt'));
        options.add(new SelectOption('BEKOEMMT','bekömmt'));
        options.add(new SelectOption('BENEIDET','beneidet'));
        options.add(new SelectOption('BESCHOENIGT','beschönigt'));
        return options;
    }
}