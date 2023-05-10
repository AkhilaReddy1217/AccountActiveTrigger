public class AccountActiveTriggerHandler { /*
    public static void handleAccounts(List<Account> accounts, Map<Id, Account> oldMap) {
        List<SQX_Team_Members_c__c> teamMembersToInsert = new List<SQX_Team_Members_c__c>();
    
        for (Account account : accounts) {
            if (Trigger.isInsert || (Trigger.isUpdate && account.Active__c != oldMap.get(account.Id).Active__c)) {
                SQX_Team_Members_c__c teamMember1 = new SQX_Team_Members_c__c();
                teamMember1.Name = 'Team Member 1';
                teamMember1.Account__c = account.Id;
                teamMembersToInsert.add(teamMember1);
            
                SQX_Team_Members_c__c teamMember2 = new SQX_Team_Members_c__c();
                teamMember2.Name = 'Team Member 2';
                teamMember2.Account__c = account.Id;
                teamMembersToInsert.add(teamMember2);
            }
        }
    
        if (!teamMembersToInsert.isEmpty()) {
            insert teamMembersToInsert;
        }
        
        // Check that accounts can only be activated by users with the "Account_Admin" permission set
        for (Account acc : accounts) {
            if (acc.Active__c) {
                List<PermissionSetAssignment> assignments = [
                    SELECT PermissionSet.Name
                    FROM PermissionSetAssignment
                    WHERE AssigneeId = :acc.OwnerId
                ];
                
                Boolean hasAccountAdminPermission = false;
                for (PermissionSetAssignment assignment : assignments) {
                    if (assignment.PermissionSet.Name == 'Account_Admin') {
                        hasAccountAdminPermission = true;
                        break;
                    }
                }
                
                if (!hasAccountAdminPermission) {
                    acc.Active__c = false;
                }
            }
        }
    }
*/}