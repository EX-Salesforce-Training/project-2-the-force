({
    hOpenPositions : function(component, event, helper) {    
        let method = component.get("c.openPositions");
        method.setCallback(this, function(response){
            if(response.getState() == "SUCCESS"){
                console.log("Success get")
                component.set("v.positions", response.getReturnValue());          
            }})
        $A.enqueueAction(method);   
    },

    hOnChange : function(cmp, evt, hlp) {
        let hSelectedPosition = cmp.find("positionSelect").get("v.value");
        console.log(cmp.find("positionSelect").get("v.value"));
        cmp.set("v.selectedPositionDesc", hSelectedPosition);
    },
    
    hPositionsNext : function(cmp, evt, hlp) {
        var hideThisDiv = cmp.find("renderPositions");
        $A.util.addClass(hideThisDiv,"toggle-hide");
        let hSelectedPosition = cmp.find("positionSelect").get("v.value");
        var event = $A.get("e.c:RecruitingAppPositionsEvent");
        event.setParams({ 
            "eSelectedPosition" : hSelectedPosition,
            "ePositionsNext" : true 
        });
        event.fire();
        console.log(event);
    },
    
    hRenderPositions : function(cmp, evt, hlp){
        var showThisDiv = cmp.find("renderPositions");
        $A.util.removeClass(showThisDiv,"toggle-hide");
//      cmp.set("v.renderPositions", true );
    },
    
    
/*    hideDiv : function(component){
        var hideThisDiv = component.find("the aura:id of the div you want to hide");
        $A.util.addClass(hideThisDiv,"toggle-hide");
    }
    
    showDiv : function(component){
        var showThisDiv = component.find("the aura:id of the div you want to show");
        $A.util.removeClass(showThisDiv,"toggle-hide");
    }    */

})