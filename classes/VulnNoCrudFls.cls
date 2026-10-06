public without sharing class VulnNoCrudFls {
    @AuraEnabled
    public static void deleteAccount(Id accId) {
        Account a = [SELECT Id FROM Account WHERE Id = :accId];
        delete a;
    }
    @AuraEnabled
    public static void updateSalary(Id contactId, Decimal salary) {
        Contact c = [SELECT Id, Salary__c FROM Contact WHERE Id = :contactId];
        c.Salary__c = salary;
        update c;
    }
}
