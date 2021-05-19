({
	retrieveCourseList : function(component) {
		console.log("init Helper")
		let courseMethod = component.get("c.getLearnerAccess");
		//send course ID to APEX controller to query for related content
		courseMethod.setParams({contactId: component.get("v.Contact")})
		
		courseMethod.setCallback(this, function(response){
				if(response.getState() == "SUCCESS"){
						component.set("v.Courses", response.getReturnValue());
						console.log("Returned Courses")
						console.log(response.getReturnValue())
						//get Course name, set v.courseName
						//get Lesson names and descriptions, use for iterator
						//get Quiz names and grades, use for iterator
				}
		})
		$A.enqueueAction(courseMethod);
	},
	renderCoursePage : function(component,event){
		var courseId = event.getParam("courseId");
		component.set("v.activeCourse", courseId);
		component.set("v.courseActive", "True");

		this.hideCourseList(component);
		
		
	},
	hideCourseList : function(component){
		console.log("attempting to hide course list")
		var displayDiv = component.find("course-list");
		$A.util.addClass(displayDiv,"toggle-hide");
	}
})