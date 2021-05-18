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
    public static void createAndInsertOrders(List<Id> courseList){
        
        Id userId = UserInfo.getUserId();
        Id currentUser = [SELECT ContactId FROM User WHERE Id = :userId LIMIT 1].contactId;
        currentUser = '0035e000003ptF4AAI';

        try {
            List<Order> orders = new List<Order>();
            for(Id course: courseList){
                Order order = new order();
                order.Course__c = course;
                order.Learner__c = currentUser;
                orders.add(order);
            }
            insert orders;

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    }
