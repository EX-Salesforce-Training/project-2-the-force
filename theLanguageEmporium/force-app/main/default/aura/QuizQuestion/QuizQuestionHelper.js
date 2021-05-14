({
    scrambleAnswers : function(component) {
        let questionObj = component.get("{!v.fields}");
        let answerArray = [
            {number: 1, correct: true, text: questionObj.Correct_Answer__c},
            {number: 2, correct: false, text: questionObj.Option_2__c},
            {number: 3, correct: false, text: questionObj.Option_3__c},
            {number: 4, correct: false, text: questionObj.Option_4__c},
        ];
        console.log("Time to scramble answers");

        shuffle(answerArray);

        function shuffle(answerArray) {
            var currentIndex = answerArray.length, temporaryValue, randomIndex;
          
            // While there remain elements to shuffle...
            while (0 !== currentIndex) {
          
              // Pick a remaining element...
              randomIndex = Math.floor(Math.random() * currentIndex);
              currentIndex -= 1;
          
              // And swap it with the current element.
              temporaryValue = answerArray[currentIndex];
              answerArray[currentIndex] = answerArray[randomIndex];
              answerArray[randomIndex] = temporaryValue;
            }
          
            return answerArray;
          };

        component.set("{!v.answerList}",answerArray)
        
        console.log(questionObj.Prompt__c);
        console.log(answerArray);
    }
})
