({
    addToCart : function(component,event) {
        var thisCourseId = component.get("{!v.courseID}");
        var thisCourseName = component.get("{!v.courseName}");
        event.setParams({
            "courseId": thisCourseId,
            "courseName": thisCourseName
        })
        console.log("You tried to add this to the cart")
        console.log(component.get("{!v.courseID}"))
    }   
})
