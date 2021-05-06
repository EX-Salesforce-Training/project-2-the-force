public class LeaderboardController {
    //------ QUIZ DATA ------//
    public List<Quiz_Data__c> quizData{get;set;}
    public List<Contact> leaderboard{get;set;}
    public Id currUserId{get;set;}
    public Decimal currRank{get;set;}
    public String nickName{get;set;}
    public Decimal totalscore{get;set;}
    public String conId{get;set;}
    public List<String> quizNames{get;set;}
    public List<Datetime> datetimes{get;set;}
    public List<String> nickNames{get;set;}
    public List<Decimal> scores{get;set;}
    public List<String> lNames{get;set;}
    public List<Decimal> lScores{get;set;}
    public List<Integer> lRankings{get;set;}
    
    public LeaderboardController() {
        quizData = [SELECT User_Nickname__c, Quiz_Date__c, Quiz_Name__c, Quiz_Score__c FROM Quiz_Data__c ORDER BY Quiz_Date__c DESC LIMIT 10];
        leaderboard = [SELECT Id, Name, Total_Score__c, (SELECT CommunityNickname FROM Users) FROM Contact WHERE Total_Score__c != null ORDER BY Total_Score__c DESC];
        
        //------ CURRENT USER DATA ------//
        String userID = String.valueOf(UserInfo.getUserId());
        User user = [SELECT Id, ContactId, CommunityNickname FROM User WHERE Id = :userID];
        currUserId = user.ContactId;
        nickName = user.CommunityNickname;
        conID = String.valueOf(user.ContactId);
        Contact currUserCon = [SELECT Id, Name, Total_Score__c, Last_Quiz__c, (SELECT Username FROM Users) FROM Contact WHERE Id = :conID];
        totalScore = currUserCon.Total_Score__c;
        
        // set user's current rank
        AggregateResult[] rankResult = [SELECT COUNT(Id) rank FROM Contact WHERE Total_Score__c > :totalScore];
        Decimal higherCount = (Decimal)rankResult[0].get('rank');
        currRank = higherCount + 1;
        
        //------ SET VARIABLES ------//
        List<String> listQuizNames = new List<String>();
        for(Quiz_Data__c qD: quizData) {
            listQuizNames.add(qD.Quiz_Name__c);
        }
        quizNames = listQuizNames;
               
        List<Datetime> listDatetimes = new List<Datetime>();
        for(Quiz_Data__c qD: quizData) {
            listDatetimes.add(qD.Quiz_Date__c);
        }
        datetimes = listDatetimes;
        
        List<String> listNickNames = new List<String>();
        for(Quiz_Data__c qD: quizData) {
            listNickNames.add(qD.User_Nickname__c);
        }
        nickNames = listNickNames;
        
        List<Decimal> listScores = new List<Decimal>();
        for(Quiz_Data__c qD: quizData) {
            listScores.add(qD.Quiz_Score__c);
        }
        scores = listScores;
        
        List<String> listLNames = new List<String>();
        for(Contact con: leaderboard) {
            listLNames.add(con.Users[0].CommunityNickname);
        }
        lNames = listLNames;
        
        List<Decimal> listLScores = new List<Decimal>();
        for(Contact con: leaderboard) {
            listLScores.add(con.Total_Score__c);
        }
        lScores = listLScores;
        
        List<Integer> listLRankings = new List<Integer>();
        for(Integer i = 0; i < leaderboard.size(); i++) {
            listLRankings.add(i + 1);
        }
        lRankings = listLRankings;
    }
        
    public Component.Apex.OutputText getGreeting(){
        List<String> greetingList = new List<String>{'Hello','Hallo','Bonjour','Salut','Buna ziuă','Hej','今日は','Saluton','Привет','你好'};
            Component.Apex.OutputText ot = new Component.Apex.OutputText();
        
        Integer randN = (Integer)Math.floor(Math.random() * greetingList.size());
        ot.value = greetingList[randN];
        
        return ot;
    }
}