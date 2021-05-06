public class TutorApplicationTriggerHandler {

    public static void FlagAppReview(List<Tutor_Application__c> appies) {
        
        // Grab Recruiting Queue ID
        /*Group recruitingQueue = [SELECT Id FROM Group WHERE Name = 'Recruiting Queue' and Type = 'Queue'];
        String recruitingQueueID = recruitingQueue.Id;

        List<Task> insertList = new List<Task>();
        Map<Id, Tutor_Application__c> m = new Map<Id, Tutor_Application__c>([SELECT Id, Learner_Account__r.Name FROM Tutor_Application__c WHERE Id IN :appies]);

        for (Tutor_Application__c a: appies) {
            Task newTask = new Task();
            newTask.Subject = 'Application Review - ' + a.Name;

            // Get ID of the Learner's account and grab name from record
            // (Can I do this from outside the loop and just map the account ids to names?)
            String tutAppId = a.Id;
            Contact l = m.get(tutAppId).Learner_Account__r;

            // Give Recruiters access to information at a glance in task
            newTask.Description = 'Learner Account: ' + l.Name + '\nApplication Date: ' +
                                a.Date_Opened__c + '\nLanguage(s): ' + a.Language_s__c + '\nLearner Since: ' + a.Learner_Since__c;

            // Assign to Recruiter queue
            newTask.OwnerId = recruitingQueueID;
            insertList.add(newTask);
        }

        insert insertList;*/
    }
}