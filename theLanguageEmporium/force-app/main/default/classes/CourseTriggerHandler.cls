////////////////////////////////////////////////////
//
// Name: CourseTriggerHandler
// Author: David J. Sellinger
// Created: 2021-04-08
// Updated: 2021-04-20
// Description: Handler for the course trigger,
// 		flagging QA (queue) to review the new 
// 		lesson.
//
////////////////////////////////////////////////////

public class CourseTriggerHandler {
    
    /*public static void FlagQAReview(List<Course__c> courses) {
        
        List<Task> insertTask = new List<Task>();
        
        // Grab Course Record ID
        // String recordTypeID = Schema.SObjectType.Course__c.getRecordTypeInfosByName().get('Course').getRecordTypeId();
        
        // Grab QA Tester Queue ID
        Group qaTestersQueue = [SELECT Id FROM Group WHERE Name = 'QA Testers Queue' and Type = 'Queue'];
        String qaTestersQueueID = qaTestersQueue.Id;
        
        // Grab Ids of new Course records and map them to the creators' names
        Map<Id, Course__c> m = new Map<Id, Course__c>([SELECT Id, Owner.Name FROM Course__c WHERE Id IN :courses]);
        
        for (Course__c c: courses) {
            // We only need records specifically of the Course type
            // if (c.RecordTypeId == recordTypeID) {
            Task newTask = new Task();
            
            // Get ID of the new Course and grab corresponding Account Name from map
            String courseId =  c.Id;
            Name a = m.get(courseId).Owner;
            
            // Create task with name of lesson and lesson creator
            newTask.Subject = 'Review New Course - ' + c.Name;
            newTask.Description = 'Course name: ' + c.Name + '\nCourse creator: ' + a.Name; // !!!
            
            // Assign task to QA Tester Queue
            newTask.OwnerId = qaTestersQueueID;
            insertTask.add(newTask);
            //}
        }
        
        // Create new task
        insert insertTask;	
    }*/
    
    public static void createProducts(List<Course__c> courses) {
        List<Product2> newProducts = new List<Product2>();
        
        // Grab Ids of new Course records and map them to the creators' names
        Map<Id, Course__c> m = new Map<Id, Course__c>([SELECT Id, Owner.Name FROM Course__c WHERE Id IN :courses]);
        
        for (Course__c c: courses) {
            Product2 newProduct = new Product2();
            String courseId =  c.Id;
            Name a = m.get(courseId).Owner;
            
            newProduct.Name = c.Name;
            newProduct.Description = 'Course creator: ' + a.Name;
            newProduct.IsActive = True;
            newProduct.Course_Record__c = courseId;
            
            newProducts.add(newProduct);
        }
        
        insert newProducts;
    }
    
    public static void CheckApproval(List<Course__c> courses) {
        for (Course__c c: courses) {
            if (c.Approved_for_Deletion__c == false) {
                System.assert(False);
            }
        }        
    }
    
    
    /*public static void SendMail() {
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        User[] u = new User[] {[SELECT Name, Email FROM User WHERE UserRole.Name = 'Head of Content Development']};
        String[] toAddress = new String[] {u[0].Email};
                
        email.setToAddresses(toAddress);
        email.setSubject('New Course Created');
        email.setPlainTextBody('Dear ' + u[0].Name + ',\nA new Course has been created. Please check the QA Tester Tasks for more information.' + 
                               '\n\nThank you,\nYour Friendly Neighborhood Salesforce Admin');
        
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
    }*/
    
}