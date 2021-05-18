({
    compInit : function(component, event, helper) {
        helper.initializeComp(component);
    },

    enrollCourses : function(component, event, helper) {
        helper.enrollCoursesH(component);
    },
    removeItemFromCart : function(component, event, helper){
        helper.dropCartItem(component, event);
    }

})
