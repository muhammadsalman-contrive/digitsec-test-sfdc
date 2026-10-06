public class VulnOpenRedirect {
    public PageReference go() {
        String url = ApexPages.currentPage().getParameters().get('retURL');
        return new PageReference(url);
    }
}
