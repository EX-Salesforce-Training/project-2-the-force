({
    hEducationInputPrevious: function (cmp, evt, hlp){
        cmp.find("renderEducationInput").set("false");
        var event = $A.get("e.c:RecruitingAppEducationInputEventPrevious");
        event.setParams({ "eEducationInputPrevious" : true });
        event.fire();	
    },
    
    hEducationInputNext: function (cmp, evt, hlp){
        cmp.find("renderEducationInput").set("false");
        var event = $A.get("e.c:RecruitingAppEducationInputEvent");
        event.setParams({ "eEducationInputNext" : true });
        event.fire();	
    },
    
    hRenderEducationInput : function(cmp, evt, hlp){
        cmp.set("v.renderEducationInput", true );
    }
    
})