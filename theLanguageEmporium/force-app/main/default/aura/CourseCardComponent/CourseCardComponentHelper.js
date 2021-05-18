({
    getThisCourse : function(component,event) {
        var renderCoursePage = component.getEvent("renderCoursePage");
        renderCoursePage.setParams({
            "courseId" : component.get("{!v.courseId}")
        });
        renderCoursePage.fire();
    }
})
