({
    hSetOutput1 : function(component, event, helper) {
        var cmpMsg1 = component.find("msg1");
        $A.util.removeClass(cmpMsg1, 'hide');  	
        var comments1 = component.find("comments1").get("v.value");
        var oTextarea = component.find("oTextarea1");
        oTextarea.set("v.value", comments1);
    },
    
    hSetOutput2 : function(component, event, helper) {
        var cmpMsg2 = component.find("msg2");
        $A.util.removeClass(cmpMsg2, 'hide');  	
        var comments2 = component.find("comments2").get("v.value");
        var oTextarea = component.find("oTextarea2");
        oTextarea.set("v.value", comments2);
    },
    
    hSetOutput3 : function(component, event, helper) {
        var cmpMsg3 = component.find("msg3");
        $A.util.removeClass(cmpMsg3, 'hide');  	
        var comments3 = component.find("comments3").get("v.value");
        var oTextarea = component.find("oTextarea3");
        oTextarea.set("v.value", comments3);
    },
    
    hAdditionalQuestionsPrevious: function (cmp, evt, hlp){
        cmp.find("renderAdditionalQuestions").set("false");
        var event = $A.get("e.c:RecruitingAppAdditionalQuestionsEventPrevious");
        event.setParams({ "eAdditionalQuestionsPrevious" : true });
        event.fire();	
    },
    
    hAdditionalQuestionsNext: function (cmp, evt, hlp){
        cmp.find("renderAdditionalQuestions").set("false");
        var event = $A.get("e.c:RecruitingAppAdditionalQuestionsEvent");
        event.setParams({ "eAdditionalQuestionsNext" : true });
        event.fire();	
    },
    
    hRenderAdditionalQuestions : function(cmp, evt, hlp){
        cmp.set("v.renderAdditionalQuestions", true );
    }    
    
    
    
})