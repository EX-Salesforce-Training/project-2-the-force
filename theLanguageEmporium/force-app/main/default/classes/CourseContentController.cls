public with sharing class CourseContentController {

    @AuraEnabled
    public static List<Lesson__c> getLessons(String courseId, String learnerId){
        try {
            List<Lesson__c> lessons = New List<Lesson__c>([SELECT id, name FROM Lesson__c WHERE course__c = :courseId]);
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Quiz_Data__c> methodName(String courseId, String learnerId){
        try {
            List<Quiz_Data__c> lessons = New List<Quiz_Data__c>([SELECT id, name FROM Quiz_Data__c WHERE course__c = :courseId AND Learner__c = :learderId]);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
