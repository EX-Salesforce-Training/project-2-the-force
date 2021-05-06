////////////////////////////////////////////////////
//
// Name: CourseGenUtilityTest
// Author: David J. Sellinger
// Created: 2021-04-08
// Updated: 2021-04-18
// Description: Generate dummy courses for the test.
// 		
//
////////////////////////////////////////////////////

@IsTest
public class CourseGenUtilityTest {
    
    public static List<Course__c> GenerateCourses(Integer numLess, String Name) {
        List<Course__c> gendCou = new List<Course__c>();
        
        for(Integer i = 0; i < numLess; i++) {
            Course__c c = new Course__c();
            
            // Required fields.
            c.Name = Name + '-' + i;
            c.Status__c = 'New';
            c.Approval_Status__c = 'Not Approved';
            gendCou.add(c);
        }
        
        return gendCou;
    }
    
}