public class StorePageController {
    @AuraEnabled
        public static List<Course__c> getCourseList(){
            List<Course__c> courseList = [SELECT Id, Name FROM Course__c];
            return courseList;
        }
    }
