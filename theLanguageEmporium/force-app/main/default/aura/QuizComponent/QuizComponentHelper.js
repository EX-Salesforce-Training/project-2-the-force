({
    generateQuestions : function(component) {
        let questionMethod = component.get("c.getQuestions");
        //send quiz ID to APEX controller to query for related questions
        questionMethod.setParams({quizId: component.get("v.quizId")})
        

        questionMethod.setCallback(this, function(response){
            if(response.getState() == "SUCCESS"){
                //Get questions from databse and send them to the shuffler
                let unsortedQuestions = response.getReturnValue()
                unsortedQuestions = this.shuffleQuestions(unsortedQuestions);

                //Give each question a number based on its new position in the array
                for (let i=0; i<unsortedQuestions.length; i++){
                    unsortedQuestions[i].number = i+1;
                }
                console.log("Returned Questions")
                console.log(unsortedQuestions)
                //Set the newly sorted and numbered questions to the view attribute
                component.set("v.questionList", unsortedQuestions);
                
            }
        });
        $A.enqueueAction(questionMethod);
    },
    shuffleQuestions : function(questionArray) {
        var currentIndex = questionArray.length, temporaryValue, randomIndex;
      
        // While there remain elements to shuffle...
        while (0 !== currentIndex) {
      
          // Pick a remaining element...
          randomIndex = Math.floor(Math.random() * currentIndex);
          currentIndex -= 1;
      
          // And swap it with the current element.
          temporaryValue = questionArray[currentIndex];
          questionArray[currentIndex] = questionArray[randomIndex];
          questionArray[randomIndex] = temporaryValue;
        }
      
        return questionArray;
      }
    
})
