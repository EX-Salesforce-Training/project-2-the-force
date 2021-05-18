({
    hOpenPositions : function(component, event, helper) {    
        let method = component.get("c.openPositions");
        method.setCallback(this, function(response){
            if(response.getState() == "SUCCESS"){
                component.set("v.positions", response.getReturnValue());          
            }})
        $A.enqueueAction(method);   
    },

    hOnChange : function(cmp, evt, hlp) {
        let hSelectedPosition = cmp.find("positionSelect").get("v.value");
        cmp.set("v.selectedPosition", hSelectedPosition);
    },
    
    hPositionsNext : function(cmp, evt, hlp) {
        cmp.set("v.renderPositions", false );
        var event = $A.get("e.c:RecruitingAppPositionsEvent");
        event.setParams({ "ePositionsNext" : true });
        event.setParams({ "eSelectedPosition" : "v.selectedPosition" });
        event.fire();
    },
    
    hRenderPositions : function(cmp, evt, hlp){
        cmp.set("v.renderPositions", true );
    }

})