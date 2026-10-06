public without sharing class VulnSoqlInjection {
    @AuraEnabled
    public static List<Contact> findContacts(String lastName) {
        String q = 'SELECT Id, Name, Email FROM Contact WHERE LastName = \'' + lastName + '\'';
        return Database.query(q);
    }
    @AuraEnabled
    public static List<Opportunity> findOpps(String stage) {
        return Database.query('SELECT Id, Amount FROM Opportunity WHERE StageName = \'' + stage + '\'');
    }
}
