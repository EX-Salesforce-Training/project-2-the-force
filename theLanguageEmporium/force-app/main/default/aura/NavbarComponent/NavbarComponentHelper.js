({
    renderHomePage : function(component, event, helper) {
        var navEvent = component.getEvent("navEvent");
        navEvent.setParams({
            "page" : "Home",
        });
        navEvent.fire();
    },
    renderAccountPage : function(component, event, helper) {
        var navEvent = component.getEvent("navEvent");
        navEvent.setParams({
            "page" : "LearnerPortal",
        });
        navEvent.fire();
    },
    renderShopPage : function(component, event, helper) {
        var navEvent = component.getEvent("navEvent");
        navEvent.setParams({
            "page" : "Shop",
        });
        navEvent.fire();
    },
    renderCareersPage : function(component, event, helper) {
        var navEvent = component.getEvent("navEvent");
        navEvent.setParams({
            "page" : "Careers",
        });
        navEvent.fire();
    },
    fireNavigator : function(component, event, helper){
        var navEvent = component.getEvent("navEvent");
        navEvent.setParams({
            "page" : component.get(""),
        });
        navEvent.fire();
    }
})
