//Abdulloh Y
//Apex Controller for functionality in the Store Component

public without sharing class StorePageController {
    
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
        Id currentUserContact = [SELECT ContactId FROM User WHERE Id = :userId LIMIT 1].contactId;
        Id currentUserAccount = [SELECT AccountId FROM User WHERE id=:userId LIMIT 1].accountId;
        Id contractId = [SELECT ID FROM Contract LIMIT 1].ID;
        currentUserContact = '0035e000003J6QmAAK';
        currentUserAccount = '0015e000004zhHzAAI';

        try {
            List<Order> orders = new List<Order>();
            for(Id course: courseList){
                Order order = new order();
                order.Course__c = course;
                order.Learner__c = currentUserContact;
                order.AccountId = currentUserAccount;
                order.EffectiveDate = Date.today();
                order.Status = 'Draft';
                order.contractId = contractId;
                orders.add(order);
            }
            insert orders;

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    }
