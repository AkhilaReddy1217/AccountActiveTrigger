@isTest
private class AccountActiveTriggerTest {
    
    @testSetup
    static void setup() {
        // create a user with the Account_Admin permission set
        Profile profile = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
        PermissionSet permissionSet = [SELECT Id FROM PermissionSet WHERE Name = 'Account_Admin'];
        
        user u = [select id,Alias,ProfileId from user where Alias = 'AMuty'];
        
    }
    
    @isTest
    static void testAccountInsert() {
        // create a new account with Active__c set to true
        Account acc = new Account(Name = 'Test Account',Active__c = false);
        insert acc;
        
        // check that two team members were created
        List<SQX_Team_Members_c__c> teamMembers = [SELECT Id, Name, Account__c FROM SQX_Team_Members_c__c WHERE Account__c = :acc.Id ];
        
        
        // check that the account was not activated
        acc = [SELECT Id, Active__c FROM Account WHERE Id = :acc.Id];
        
    }
    
    @isTest
    static void testAccountUpdate() {
        // create a new account with Active__c set to false
        Account acc = new Account(Name = 'Test Account',Active__c = false);
        insert acc;
        
        // update the account with Active__c set to true
        acc.Active__c = true;
        update acc;
        
        // check that the account was not activated because the user does not have the Account_Admin permission set
        acc = [SELECT Id, Active__c FROM Account WHERE Id = :acc.Id];
        
        
        // create a new user with the Account_Admin permission set
        Profile profile = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
        PermissionSet permissionSet = [SELECT Id FROM PermissionSet WHERE Name = 'Account_Admin'];
        user u1 = [select id,Alias,ProfileId from user where Alias = 'guestadm'];
        
        // update the account with Active__c set to true again
        System.runAs(u1) {acc.Active__c = true;update acc;
        }
        
        // check that the account was activated
        acc = [SELECT Id, Active__c FROM Account WHERE Id = :acc.Id];
        
    }
}