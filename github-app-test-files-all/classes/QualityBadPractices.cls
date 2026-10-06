public class QualityBadPractices {
    public static void process(List<Id> ids) {
        for (Id i : ids) {
            Account a = [SELECT Id, Name FROM Account WHERE Id = :i];
            a.Name = a.Name + ' x';
            update a;
        }
        try {
            Integer unused = 5;
            Integer n = 10 / 0;
        } catch (Exception e) {
        }
        if (ids.size() > 1) { if (ids.size() > 2) { if (ids.size() > 3) { if (ids.size() > 4) { System.debug('deep'); } } } }
    }
}
