({
	doInit : function(component, event, helper) {
	var action = component.get("c.fetchUser");
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log("This is the state");
            console.log(state);
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
                console.log(storeResponse);
                console.log('logging apex return');
               // set current user information on userInfo attribute
                component.set("v.userInfo", storeResponse);
            }
            else if (state === "ERROR"){
                console.log(response.getError());


            }
        });
        $A.enqueueAction(action);
    }
})