({
    hHandleGender: function (cmp, evt, hlp) {
        // This will contain the string of the "value" attribute of the selected option
        var selectedOptionValue = evt.getParam("value");
    },
    
    hHandleEthnicity: function (cmp, evt, hlp) {
        // This will contain an array of the "value" attribute of the selected options
        var selectedOptionValue = evt.getParam("value");
    },
    
    hHandleVeteran: function(cmp, evt, hlp) {
        var selected = evt.getSource().get("v.veteranLabel");    
        var resultCmp = cmp.find("VeteranResult");
        resultCmp.set("v.veteranValue", selected);
    },
    
    hHandleDisability: function(cmp, evt, hlp) {
        var selected = evt.getSource().get("v.disabilityLabel");
        var resultCmp = cmp.find("DisabilityResult");
        resultCmp.set("v.disabilityValue", selected);
    }
    
});