({
    initPage : function(component, event, helper){
        helper.retrieveCourseContent(component);
    },
    showDisplay : function(component, event, helper) {
        var displayDiv = component.find("course-display");
        $A.util.addClass(displayDiv,"toggle-hide");
    },
    hideDisplay : function(component, event, helper) {
        var displayDiv = component.find("course-display");
        $A.util.removeClass(displayDiv,"toggle-hide");
    },
})