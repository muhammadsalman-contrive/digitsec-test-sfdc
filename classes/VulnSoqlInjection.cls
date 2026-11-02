public without sharing class VulnSoqlInjection {
    @AuraEnabled
    public static List<Contact> findContacts(String lastName) {
        String q = 'SELECT Id, Name, Email FROM Contact WHERE LastName = \'' + lastName + '\'';
        return Database.query(q);
    }
}
