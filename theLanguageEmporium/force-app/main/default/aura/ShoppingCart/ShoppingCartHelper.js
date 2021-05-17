({
    initializeComp : function(component) {
        let courseListMethod = component.get("c.getCourseList");
        courseListMethod.setCallback(this, function(response){
            if(response.getState() === "SUCCESS"){
                component.set("v.courseListSC", response.getReturnValue());
            }
        });
        $A.enqueueAction(courseListMethod);
    },

    enrollCoursesH: function(component) {
        let courseList = component.get("v.courseListSC");
        let method = component.get("c.createAndInsertOrders");
        method.setParams({courseList : courseList});
        method.setCallback(this, function(response){
            if(response.getState() === "SUCCESS"){
            //success
            }
        });
        $A.enqueueAction(method);
    }
})
