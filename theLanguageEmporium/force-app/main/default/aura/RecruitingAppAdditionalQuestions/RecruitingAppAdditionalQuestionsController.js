({
    cSetOutput1 : function(component, event, helper) {
        helper.hSetOutput3 (component);
    },
    
    cSetOutput2 : function(component, event, helper) {
        helper.hSetOutput3 (component);
    },

    cSetOutput3 : function(component, event, helper) {
        helper.hSetOutput3 (component);
    },

    cAdditionalQuestionsPrevious: function (cmp, evt, hlp){
        hlp.hHandleSubmit (cmp);		
    },
    
    cAdditionalQuestionsNext: function (cmp, evt, hlp){
        hlp.hHandleSubmit (cmp);		
    },
    
    cRenderAdditionalQuestions : function(cmp, evt, hlp){
        hlp.hRenderAdditionalQuestions (cmp);
    }
})