public class OrderCExtension {        
    
    //set up various getters and setters
    public User currentUser {get;set;}
    public Contact currentContact {get;set;}
    public Order__c currentOrder{get;set;}
    public List <Line_Item__c> orderList {get;set;}
    Id courseId{get;set;}
    public List<Course__c> courses{get;set;}
    
    public OrderCExtension(){
        
        //identify current user
        //currentUser = [SELECT Id, ContactId FROM User WHERE id=:userinfo.getuserid() LIMIT 1];
        //system.debug(currentUser.Id);
        //system.debug(currentUser.ContactId);
        
        //identify current contact via user
        //currentContact=[SELECT id FROM Contact WHERE id = :currentUser.ContactId LIMIT 1];
        currentContact = new Contact(id='0035e000001x68XAAQ');
        
    
        //if there is no order on page, check to see if an order exists for the current contact
        if (currentOrder == null) {    
            currentOrder = checkForOrders();
        	}
            system.debug(currentOrder.id);
        
        //fill the orderList (to be inserted to order) with line items from current order
        if(currentOrder.id!=null){
        	orderList = [SELECT (SELECT Course__c FROM Line_Items__r) FROM Order__c WHERE id= :currentOrder.id].Line_Items__r;
        }
                
        //pouplate courses on VF page from database that have new status
        courses = [SELECT Name, Language__c, of_Lessons__c FROM Course__c WHERE Status__c = 'New'];
    }
    
    //method to check for orders
    private Order__c checkForOrders(){
        //check for existing orders
        List <Order__c> check = [SELECT (SELECT Course__c FROM Line_Items__r) FROM Order__c WHERE Contact__c= :currentContact.id];
        //if there is none, create order, insert, and return
        if(check.size()==0){
            Order__c newOrder = new Order__c(Contact__c = currentContact.id);
            //insert newOrder;
            return newOrder;
        }else{
            //otherwise return the first checked value
            return check[0];
        }
    }
    
    public void AddToOrder(){
        courseId = getParam('courseId');
        createOrUpdateLineItem(courseId);
        //updateAndRefreshOrder();
    }
    
     private String getParam(String key){
        return ApexPages.currentPage().getParameters().get(key);
    }
    
    private void createOrUpdateLineItem(Id courseId) {
        Line_Item__c li = getExistingLineItem(courseId);
        if (li == null) {
            li = new Line_Item__c(Course__c = courseId, Order__c = currentOrder.Id);
            orderList.add(li);
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