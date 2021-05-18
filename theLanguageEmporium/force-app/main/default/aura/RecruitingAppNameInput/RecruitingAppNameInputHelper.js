({
    hHandleClick : function(cmp, evt, hlp) {
        var name = cmp.find("myName");
        var isValid = name.checkValidity();
        if(isValid) {
            alert("Creating new contact for " + name.get("v.lastName"));
        }
        else {
            name.showHelpMessageIfInvalid();
        };
        cmp.set("v.nameInput", name);   
    },
    
    hNameInput : function (cmp, evt, hlp){
        var hName = cmp.find("nameInput").get("v.value");
        var event = $A.get("e.c:RecruitingAppNameInputEvent");
        event.setParams({ "eNameInput" : hName });
        event.fire();
    }
})