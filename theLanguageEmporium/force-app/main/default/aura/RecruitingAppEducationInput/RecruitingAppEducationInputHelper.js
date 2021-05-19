({
    hEducationInputPrevious: function (cmp, evt, hlp){
        var hideThisDiv = cmp.find("renderEducationInput");
        $A.util.addClass(hideThisDiv,"toggle-hide");
        var event = $A.get("e.c:RecruitingAppEducationInputEventPrevious");
        event.setParams({ "eEducationInputPrevious" : true });
        event.fire();	
    },
    
    hEducationInputNext: function (cmp, evt, hlp){
        var hideThisDiv = cmp.find("renderEducationInput");
        $A.util.addClass(hideThisDiv,"toggle-hide");
        var event = $A.get("e.c:RecruitingAppEducationInputEvent");
        event.setParams({ "eEducationInputNext" : true });
        event.setParams({ "eCandidateID" : "v.vCandidateID" });
        event.fire();	
    },
    
    hRenderEducationInput : function(cmp, evt, hlp){
        var showThisDiv = cmp.find("renderEducationInput");
        $A.util.removeClass(showThisDiv,"toggle-hide");
        let eCandidateID = evt.getParam("eCandidateID");
        cmp.set("vCandidateID", eCandidateID);
    }
    
})