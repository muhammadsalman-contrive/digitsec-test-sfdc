public class VulnInsecureCallout {
    public static String fetch(String apiKey) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('http://api.example.com/v1/data?key=' + apiKey);
        req.setMethod('GET');
        HttpResponse res = new Http().send(req);
        System.debug('Response with key ' + apiKey + ': ' + res.getBody());
        return res.getBody();
    }
}
