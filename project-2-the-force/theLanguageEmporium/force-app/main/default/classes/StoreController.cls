public class StoreController {        
    
    //set up various getters and setters
    public User currentUser {get;set;}
    public Contact currentContact {get;set;}
    public Order__c currentOrder{get;set;}
    public List <Line_Item__c> orderList {get;set;}
    Id courseId{get;set;}
    public List<Course__c> courses{get;set;}
    public List<Course__c> courseNames{get;set;}
    
    public StoreController(){
        
        //identify current user
        //currentUser = [SELECT Id, ContactId FROM User WHERE id=:userinfo.getuserid() LIMIT 1];
        //system.debug(currentUser.Id);
        //system.debug(currentUser.ContactId);
        
        //identify current contact via user
        //currentContact=[SELECT id FROM Contact WHERE id = :currentUser.ContactId LIMIT 1];
        currentContact = new Contact(id='0035e000002wtvFAAQ');
        system.debug(currentContact.id);
        
    
        //if there is no order on page, check to see if an order exists for the current contact
        //if (currentOrder == null) {    
            currentOrder = checkForOrders();
        	//}
            system.debug(currentOrder.id);	
        
        //fill the orderList (to be inserted to order) with line items from current order
        if(currentOrder.id!=null){
        	orderList = [SELECT (SELECT Course__c FROM Line_Items__r) FROM Order__c WHERE id= :currentOrder.id].Line_Items__r;
        }else{
            orderlist = new List<Line_Item__c>();
        }
        
                       
        //pouplate courses on VF page from database that have new status
        courses = [SELECT Id, Name, Language__c, of_Lessons__c FROM Course__c WHERE Status__c = 'New'];
        system.debug(courses[0].id);
        
        courseNames = new List<Course__c>();
    }
    
    //method to check for orders
    private Order__c checkForOrders(){
        //check for existing orders
        List <Order__c> check = [SELECT (SELECT Course__c FROM Line_Items__r) FROM Order__c WHERE Contact__c= :currentContact.id];
        //if there is none, create order, insert, and return
        if(check.size()==0){
            system.debug(currentContact.id);
            Order__c newOrder = new Order__c(Contact__c = currentContact.id);
            system.debug(newOrder);
            //insert newOrder;
            return newOrder;
        }else{
            //otherwise return the first checked value
            return check[0];
        }
    }
    
    //method for adding to cart
    public PageReference AddToOrder(){
        PageReference cp = system.currentPageReference();
         courseId = cp.getParameters().get('courseId');
        //courseId = getParam('courseId');
        system.debug(courseId);
        createOrUpdateLineItem(courseId);
        //updateAndRefreshOrder();
        List<Id> courseIds = new List<Id>();
        for(Line_Item__c li: orderList){
            courseIds.add(li.Course__c);
            
        }
        courseNames = [SELECT Id, Name FROM Course__c WHERE Id IN :courseIds];
        return null;
    }
    
     //private String getParam(String key){
        //PageReference cp = system.currentPageReference();
         //return cp.getParameters().get(key);
    //}
    
    // method for creating or updating line item
    private void createOrUpdateLineItem(Id courseId) {
        if(currentOrder.Id==null){
            insert currentOrder;
        }
        Line_Item__c li = getExistingLineItem(courseId);
        if (li == null) {
            li = new Line_Item__c(Course__c = courseId, Order__c = currentOrder.Id);
           
            insert li;
            orderList.add(li);
            system.debug(orderList);
        }        
    }
    
    private Line_Item__c getExistingLineItem(Id courseId) {
        Line_Item__c li = null;
        for (Line_Item__c lineItem : orderList) {
            if (lineItem.Course__c.equals(courseId)) {
                return lineItem;
            }
        }
        return null;
    }
    
        
    
    /*private void updateAndRefreshOrder() {
        update theOrder;
        refreshOrder();
    }*/
    
    }