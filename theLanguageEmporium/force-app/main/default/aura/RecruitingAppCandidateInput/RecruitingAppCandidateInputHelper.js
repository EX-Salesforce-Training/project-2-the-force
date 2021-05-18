({
    hCandidateInputPrevious: function (cmp, evt, hlp){
//      cmp.find("renderCandidateInput").set("false"); ???
        cmp.set("v.renderCandidateInput", false );
        var event = $A.get("e.c:RecruitingAppCandidateInputEventPrevious");
        event.setParams({ "eCandidateInputPrevious" : true });
        event.fire();	
    },
    
    hCandidateInputNext: function (cmp, evt, hlp){
        
/*      var name = cmp.find("candidateInputForm");
        var isValid = name.checkValidity();
        if(isValid) {
            alert("Creating new candidate record for " + name.get("v.Last_Name__c"));
        }
        else {
            name.showHelpMessageIfInvalid();
        }; */
        
//      cmp.find("v.renderCandidateInput").set("false"); ???
        cmp.set("v.renderCandidateInput", false );
        var event = $A.get("e.c:RecruitingAppCandidateInputEvent");
        event.setParams({ "eCandidateInputNext" : true });
        event.fire();	
    },
    
    hRenderCandidateInput : function(cmp, evt, hlp){
        cmp.set("v.renderCandidateInput", true );
    }
    
})