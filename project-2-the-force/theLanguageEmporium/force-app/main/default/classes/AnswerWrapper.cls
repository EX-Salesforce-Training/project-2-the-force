public class AnswerWrapper {
	
    public Candidate_Answer__c answer{get; set;}
    public Position_Question__c question{get; set;}
    
    public AnswerWrapper(Position_Question__c newQuestion, Candidate_Answer__c newAnswer){
        answer = newAnswer;
        question = newQuestion;
    }
    
}