public class NavBarController {
    public PageReference home;
    
    public void NavBarController() {
        home = new PageReference('/apex/LandingPage');
    }
    
    public PageReference getHome(){
        return home;
    }
    
}