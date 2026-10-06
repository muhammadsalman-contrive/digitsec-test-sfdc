public class VulnWeakCrypto {
    public static Blob hash(String input) {
        return Crypto.generateDigest('MD5', Blob.valueOf(input));
    }
    public static Blob encrypt(String data) {
        Blob key = Blob.valueOf('1234567890123456');
        return Crypto.encryptWithManagedIV('AES128', key, Blob.valueOf(data));
    }
}
