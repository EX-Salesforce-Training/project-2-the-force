({
	getCourses : function(component, event, helper) {
		helper.retrieveCourseList(component);
	},
	enterCourse : function(component, event, helper) {
		helper.renderCoursePage(component, event);
	}
})