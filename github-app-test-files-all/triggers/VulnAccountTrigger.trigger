trigger VulnAccountTrigger on Account (before insert, before update) {
    for (Account a : Trigger.new) {
        String q = 'SELECT Id FROM Contact WHERE AccountId = \'' + a.Id + '\' AND Name = \'' + a.Name + '\'';
        List<Contact> cs = Database.query(q);
        System.debug('Account ' + a.Name + ' secret=' + a.Description);
    }
}
