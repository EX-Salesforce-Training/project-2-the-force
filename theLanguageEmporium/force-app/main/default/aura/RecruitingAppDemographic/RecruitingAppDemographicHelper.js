({
    hDemographicPrevious: function (cmp, evt, hlp){
        var hideThisDiv = cmp.find("renderDemographic");
        $A.util.addClass(hideThisDiv,"toggle-hide");
        var event = $A.get("e.c:RecruitingAppDemographicEventPrevious");
        event.setParams({ "eDemographicPrevious" : true });
        event.fire();	
    },
    
    hDemographicNext: function (cmp, evt, hlp){
        var hideThisDiv = cmp.find("renderDemographic");
        $A.util.addClass(hideThisDiv,"toggle-hide");
        var event = $A.get("e.c:RecruitingAppDemographicEvent");
        event.setParams({ "eDemographicNext" : true });
        event.setParams({ "eCandidateID" : "v.vCandidateID" });
        event.fire();
    },
    
	hRenderExperienceInput : function(cmp, evt, hlp){
        var showThisDiv = cmp.find("renderExperienceInput");
        $A.util.removeClass(showThisDiv,"toggle-hide");
        let eCandidateID = evt.getParam("eCandidateID");
        cmp.set("vCandidateID", eCandidateID);
    },
    
    hHandleGender: function (cmp, evt, hlp) {
        let hSelectedGender = cmp.find("genderSelect").get("v.value");
        cmp.set("v.genderSelection", hSelectedPosition);
    },
    
    hHandleEthnicity: function (cmp, evt, hlp) {
        let hSelectedEthnicity = cmp.find("ethnicitySelect").get("v.value");
        cmp.set("v.ethnicitySelection", hSelectedPosition);
    },
    
    hHandleVeteran: function(cmp, evt, hlp) {
        let hSelectedVeteran = cmp.find("veteranSelect").get("v.value");
        cmp.set("v.veteranSelection", hSelectedVeteran);
    },
    
    hHandleDisability: function(cmp, evt, hlp) {
        let hSelectedDisability = cmp.find("disabilitySelect").get("v.value");
        cmp.set("v.disabilitySelection", hSelectedDisability);
    }
    
});