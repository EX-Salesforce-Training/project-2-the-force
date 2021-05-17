({
    addToCart : function(component,event) {
        var thisCourseId = component.get("{!v.courseID}");
        event.setParams({
            "courseId": thisCourseId
        })
        console.log("You tried to add this to the cart")
        console.log(component.get("{!v.courseID}"))
    }   
})
