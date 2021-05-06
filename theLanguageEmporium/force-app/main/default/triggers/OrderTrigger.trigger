////////////////////////////////////////////////////
//
// Name: OrderTrigger
// Author: David J. Sellinger, Revature Associate
// Created: 04/08/2021
// Updated: 04/08/2021
// Description: When an order for a course is
// 		created, create a Learner Access record to
// 		keep track of the learner's access to the
// 		course.
//
////////////////////////////////////////////////////

trigger OrderTrigger on Order (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    switch on trigger.operationType {
        when BEFORE_INSERT{
            
        }
        when BEFORE_UPDATE{
            
        }
        when BEFORE_DELETE{
            
        }
        when AFTER_UPDATE {
            
        }
        when AFTER_DELETE {
            
        }
        when AFTER_UNDELETE {
            
        }
        when AFTER_INSERT {
            OrderTriggerHandler.LearnerAccessGen(trigger.new);
        }
    }
}