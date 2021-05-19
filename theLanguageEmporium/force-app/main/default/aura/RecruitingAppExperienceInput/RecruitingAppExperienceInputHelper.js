({
    hExperienceInputPrevious: function (cmp, evt, hlp){
        var hideThisDiv = cmp.find("renderExperienceInput");
        $A.util.addClass(hideThisDiv,"toggle-hide");
        var event = $A.get("e.c:RecruitingAppExperienceInputEventPrevious");
        event.setParams({ "eExperienceInputPrevious" : true });
        event.fire();	
    },
    
    hExperienceInputNext: function (cmp, evt, hlp){
        var hideThisDiv = cmp.find("renderExperienceInput");
        $A.util.addClass(hideThisDiv,"toggle-hide");
        var event = $A.get("e.c:RecruitingAppExperienceInputEvent");
        event.setParams({ "eExperienceInputNext" : true });
        event.setParams({ "eCandidateID" : "v.vCandidateID" });
        event.fire();
    },
    
    hRenderExperienceInput : function(cmp, evt, hlp){
        var showThisDiv = cmp.find("renderExperienceInput");
        $A.util.removeClass(showThisDiv,"toggle-hide");
        let eCandidateID = evt.getParam("eCandidateID");
        cmp.set("vCandidateID", eCandidateID);
    }
    
})