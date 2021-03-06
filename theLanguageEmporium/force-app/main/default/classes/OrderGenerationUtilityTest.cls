@isTest
public class OrderGenerationUtilityTest {
    
    public static List<Order> GenerateOrders(Integer numO, String Name) {
        List<Order> gendO = new List<Order>();
        
        for(Integer i = 0; i < numO; i++) {
            Order o = new Order();
            o.Status = 'Draft';
            o.Course__c = 'a065Y00001vKqtXQAS';
            o.AccountId = '0015Y00002h80B2QAI';
            o.EffectiveDate = system.today();
            gendO.add(o);
        }
        
        return gendO;
    }
    
}