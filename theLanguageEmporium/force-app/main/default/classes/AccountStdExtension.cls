public class AccountStdExtension {
    
    public List<Account> accountList{get; set;} 
    
    public AccountStdExtension(ApexPages.StandardSetController sc) {
        accountList = [Select Name, Id, (Select Name, Phone FROM Contacts) FROM Account];
    }
    
}