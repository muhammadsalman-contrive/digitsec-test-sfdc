public class VulnHardcodedSecrets {
    private static final String CLIENT_SECRET = 'a1b2c3d4e5f60718293a4b5c6d7e8f90';
    private static final String DB_PASSWORD = 'P@ssw0rd!2024';
    private static final String AWS_KEY = 'AKIAIOSFODNN7EXAMPLE';

    @AuraEnabled
    public static List<Account> searchAccounts(String userInput) {
        String q = 'SELECT Id, Name FROM Account WHERE Name = \'' + userInput + '\'';
        return Database.query(q);
    }
}
