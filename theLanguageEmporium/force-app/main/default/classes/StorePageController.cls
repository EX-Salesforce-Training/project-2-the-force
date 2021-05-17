//Abdulloh Y
//Apex Controller for functionality in the Store Component

public class StorePageController {
    
    //Method to get the available courses with relevant fields from the database.
    @AuraEnabled
        public static List<Course__c> getCourseList(){
            try {
            List<Course__c> courseList = [SELECT Id, Name, Start_Date__c, Language__c FROM Course__c];
            return courseList;
            } catch (Exception e) {
                throw new AuraHandledException(e.getMessage());
            }
        }

    //Method to insert orders with the courses that were in the shopping cart.
    @AuraEnabled
    public static void createAndInsertOrders(List<Course__c> courseList){
        try {
            List<Order> orders = new List<Order>();
            for(Course__c crs: courseList){
                Order order = new order();
                //order.Course__c = crs.id;
                //order.Learner__c = crs.???
            }
            insert orders;

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    }
