////////////////////////////////////////////////////
//
// Name: CourseTrigger
// Author: David J. Sellinger
// Created: 2021-04-08
// Updated: 2021-04-18
// Description: After creating a lesson record, flag
// 		QA (queue) to review the new lesson.
//
////////////////////////////////////////////////////

trigger CourseTrigger on Course__c (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    switch on trigger.operationType {
        when BEFORE_INSERT{
            
        }
        when BEFORE_UPDATE{
            
        }
        when AFTER_UPDATE {
            
        }
        when AFTER_DELETE {
            
        }
        when AFTER_UNDELETE {
            
        }
        when BEFORE_DELETE{
            CourseTriggerHandler.CheckApproval(trigger.old);
        }
        when AFTER_INSERT {
            //CourseTriggerHandler.FlagQAReview(trigger.new);
            CourseTriggerHandler.CreateProducts(trigger.new);
            //CourseTriggerHandler.SendMail();
        }
    }
}