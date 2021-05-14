({
    retrieveCourseContent : function(component) {
        console.log("init Helper")
        let lessonMethod = component.get("c.getLessons");
        //send course ID to APEX controller to query for related content
        lessonMethod.setParams({courseId: component.get("v.courseId")})
        
        lessonMethod.setCallback(this, function(response){
            if(response.getState() == "SUCCESS"){
                component.set("v.lessonList", response.getReturnValue());
                console.log("Returned Lessons")
                console.log(response.getReturnValue())
                //get Course name, set v.courseName
                //get Lesson names and descriptions, use for iterator
                //get Quiz names and grades, use for iterator
            }
        })

        let quizMethod = component.get("c.getQuizzes");
        //send course ID to APEX controller to query for related content
        quizMethod.setParams({courseId: component.get("v.courseId")})
        
        quizMethod.setCallback(this, function(response){
            if(response.getState() == "SUCCESS"){
                component.set("v.quizList", response.getReturnValue());
                console.log("Returned Quizzes")
                console.log(response.getReturnValue())
                console.log("Set Quizzes")
                console.log(component.get("v.quizList"))
                //get Course name, set v.courseName
                //get Lesson names and descriptions, use for iterator
                //get Quiz names and grades, use for iterator
            }
        })
        $A.enqueueAction(lessonMethod);
        $A.enqueueAction(quizMethod);
    },
    hideDisplay : function(component, event, helper) {
        var displayDiv = component.find("course-display");
        $A.util.addClass(displayDiv,"toggle-hide");
    },
    showDisplay : function(component, event, helper) {
        var displayDiv = component.find("course-display");
        $A.util.removeClass(displayDiv,"toggle-hide");
    },
    renderQuizOrLesson : function(component, event, helper) {
        var contentType = event.getParam("contentType")
        var contentId = event.getParam("contentId")

        this.hideDisplay(component);
        component.set("v.activeContentId", contentId)

        switch(contentType){
            
            case "Quiz":
                console.log("You clicked on a Quiz")
                component.set("v.activeQuiz", "true")
                break;

            case "Lesson":
                console.log("You clicked on a Lesson")
                component.set("v.activeLesson", "true")
                break;
        }
    },
})