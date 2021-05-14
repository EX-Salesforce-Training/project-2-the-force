public with sharing class CourseContentController {

    @AuraEnabled
    public static List<Lesson__c> getLessons(String courseId, String learnerId){
        try {
            List<Lesson__c> lessons = New List<Lesson__c>([SELECT id FROM Lesson__c WHERE course__c = :courseId ORDER BY Lesson_Number__c ASC]);
            return lessons;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Quiz__c> getQuizzes(String courseId, String learnerId){
        try {
            List<Quiz__c> quizzes = New List<Quiz__c>([SELECT id FROM Quiz__c WHERE course__c = :courseId ]);
            return quizzes;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
