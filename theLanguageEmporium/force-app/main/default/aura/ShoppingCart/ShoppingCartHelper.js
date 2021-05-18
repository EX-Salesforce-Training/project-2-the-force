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

    submitCourses: function(component) {
        let courseList = component.get("v.courseListSC");
        let method = component.get("c.createAndInsertOrders");
        method.setParams({courseList : courseList});
        method.setCallback(this, function(response){
            if(response.getState() === "SUCCESS"){
                console.log("Orders Created")
            //success
            }
        });
        $A.enqueueAction(method);
    },
    dropCartItem: function(component, event){
        var removeId = event.getParam("courseId");
        let courseList = component.get("v.courseListSC");

        const index = courseList.indexOf(removeId);
        if (index > -1) {
        courseList.splice(index, 1);
        }

        component.set("v.courseListSC", courseList);
        console.log(courseList) 
    }   
})
