({
	doInit : function(component, event, helper) {
	var action = component.get("c.fetchUser");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
               // set current user information on userInfo attribute
                component.set("v.userInfo", storeResponse);
            } 
        });
        $A.enqueueAction(action);
    },
    hideInfo : function(component, event, helper){
        console.log("Hidding account info")
        var displayDiv = component.find("account-info");
		$A.util.removeClass(displayDiv,"toggle-hide");
    }
})