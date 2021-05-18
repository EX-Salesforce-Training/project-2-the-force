public with sharing class RecruitingAppPositionsAPEX {
    @AuraEnabled
    public static List<Position__c> openPositions() {
        List<Position__c> openPositions = [SELECT ID, Name, Description__c, Status__c, Course_Dev_Team__C FROM Position__c WHERE Status__c != 'Closed'];
        return openPositions;
    }
}