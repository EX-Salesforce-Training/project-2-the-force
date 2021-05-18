({
    addToCart : function(component,event) {
        var addToCart = component.getEvent("addToCart");
        var thisCourseId = component.get("{!v.courseID}");
        var thisCourseName = component.get("{!v.courseName}");

        addToCart.setParams({
            "courseId": thisCourseId,
            "courseName": thisCourseName
        })

        addToCart.fire();
    }   
})
