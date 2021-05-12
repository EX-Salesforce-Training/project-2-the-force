({
    retrieveCourseContent : function(component) {
        let apexMethod = component.get("c.CourseContent");
        //send course ID to APEX controller to query for related content
        apexMethod.setParams({courseId: component.get("v.courseId")})
        
        apexMethod.setCallback(this, function(response){
            if(response.getState() == "SUCCESS"){
                //get Course name, set v.courseName
                //get Lesson names and descriptions, use for iterator
                //get Quiz names and grades, use for iterator
            }
        })
    }
})