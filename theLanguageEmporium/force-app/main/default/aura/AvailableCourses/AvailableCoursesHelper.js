({
    initializeComp : function(component) {
        let courseListMethod = component.get("c.getCourseList");
        courseListMethod.setCallback(this, function(response){
            if(response.getState() === "SUCCESS"){
                component.set("v.courseList", response.getReturnValue());
            }
        });
        $A.enqueueAction(courseListMethod);
    }
})
