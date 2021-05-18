({
    hOpenPositions : function(component) {    
        let method = component.get("c.openPositions");
        method.setCallback(this, function(response){
            if(response.getState() == "SUCCESS"){
                component.set("v.positions", response.getReturnValue());
                
            }}
                          )
        $A.enqueueAction(method);
    }})