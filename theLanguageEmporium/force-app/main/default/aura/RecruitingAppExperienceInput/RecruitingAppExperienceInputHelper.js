({
    hExperienceInputPrevious: function (cmp, evt, hlp){
        cmp.find("renderExperienceInput").set("false");
        var event = $A.get("e.c:RecruitingAppExperienceInputEventPrevious");
        event.setParams({ "eExperienceInputPrevious" : true });
        event.fire();	
    },
    
    hExperienceInputNext: function (cmp, evt, hlp){
        cmp.find("renderExperienceInput").set("false");
        var event = $A.get("e.c:RecruitingAppExperienceInputEvent");
        event.setParams({ "eExperienceInputNext" : true });
        event.fire();	
    },
    
    hRenderExperienceInput : function(cmp, evt, hlp){
        cmp.set("v.renderExperienceInput", true );
    }
    
})