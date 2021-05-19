({
    hCandidateInputPrevious: function (cmp, evt, hlp){
        var hideThisDiv = cmp.find("renderCandidateInput");
        $A.util.addClass(hideThisDiv,"toggle-hide");
        var event = $A.get("e.c:RecruitingAppCandidateInputEventPrevious");
        event.setParams({ "eCandidateInputPrevious" : true });
        event.fire();	
    },
    
    hCandidateInputNext: function (cmp, evt, hlp){ 
        let ID = cmp.find("ID");
        cmp.set("v.vCandidateID", ID);
        var hideThisDiv = cmp.find("renderCandidateInput");
        $A.util.addClass(hideThisDiv,"toggle-hide");
        var event = $A.get("e.c:RecruitingAppCandidateInputEvent");
        event.setParams({ "eCandidateInputNext" : true,
                          "eSelectedPosition" : "v.vSelectedPosition",
        				  "eCandidateID" : "v.vCandidateID" });
   	 	event.fire();	
},
 
 hRenderCandidateInput : function(cmp, evt, hlp){
    var showThisDiv = cmp.find("renderCandidateInput");
    $A.util.removeClass(showThisDiv,"toggle-hide");
    let eCandidateID = evt.getParam("eCandidateID");
    let eSelectedPosition = evt.getParam("eSelectedPosition");
    cmp.set("vSelectedPosition", eSelectedPosition);
    cmp.set("vCandidateID", eCandidateID);
}

})