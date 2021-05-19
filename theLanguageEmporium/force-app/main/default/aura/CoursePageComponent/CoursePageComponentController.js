({
    initPage : function(component, event, helper){
        console.log("init controller")
        helper.retrieveCourseContent(component);
    },
    startQuiz : function(component, event, helper){
        //Hide the basic display
        helper.hideDisplay(component);
        helper.setQuiz(component);

        //change page layout to Quiz mode
        component.set("v.activeQuiz", "true");
        console.log("Quiz Started");

    },
    endQuiz : function(component, event, helper){
        //Hide the basic display
        helper.showDisplay(component);
        component.set("v.activeQuiz", "false");
        console.log("Quiz Ended");
        
        //Get the clicked quiz id and set it
        //set active quiz to true

    },
    startLesson : function(component, event, helper){
        //Hide the basic display
        helper.hideDisplay(component);
        component.set("v.activeLesson", "true")
        console.log("Lesson Started");
        
        //Get the clicked quiz id and set it
        //set active quiz to true

    },
    endLesson : function(component, event, helper){
        //Hide the basic display
        helper.showDisplay(component);
        component.set("v.activeLesson", "false")
        console.log("Lesson Ended");
        
        //Get the clicked quiz id and set it
        //set active quiz to true

    },
    startContent : function(component, event, helper){
        helper.renderQuizOrLesson(component,event);
        console.log("EventRecieved...");
    },
})