public without sharing class VulnTest {

    // Hardcoded credentials
    private static final String API_KEY = 'sk_live_51H8xYzAbCdEfGhIjKlMnOpQr';
    private static final String PASSWORD = 'Admin@123456';

    // SOQL injection: user input concatenated into a dynamic query
    @AuraEnabled
    public static List<Account> searchAccounts(String name) {
        String q = 'SELECT Id, Name, Phone FROM Account WHERE Name = \'' + name + '\'';
        return Database.query(q);
    }

    // No CRUD/FLS checks on query or DML, plus mass update by user-supplied Id
    @AuraEnabled
    public static void updatePhone(Id accId, String phone) {
        Account a = [SELECT Id, Phone FROM Account WHERE Id = :accId];
        a.Phone = phone;
        update a;
    }

    // Insecure HTTP callout with secret in the URL
    public static String callExternal() {
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('http://api.example.com/data?key=' + API_KEY);
        req.setMethod('GET');
        HttpResponse res = h.send(req);
        return res.getBody();
    }

    // Weak hashing and a fixed encryption key
    public static Blob weakHash(String input) {
        return Crypto.generateDigest('MD5', Blob.valueOf(input));
    }
    public static Blob encrypt(String data) {
        Blob key = Blob.valueOf('1234567890123456');
        return Crypto.encryptWithManagedIV('AES128', key, Blob.valueOf(data));
    }

    // Open redirect built from a request parameter
    public PageReference goTo() {
        String url = ApexPages.currentPage().getParameters().get('retURL');
        return new PageReference(url);
    }

    // Sensitive data written to debug logs
    public static void login(String user, String pwd) {
        System.debug('Login attempt: ' + user + ' / ' + pwd);
    }
}
