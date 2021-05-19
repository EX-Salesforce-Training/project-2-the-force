({
    getThisCourse : function(component,event) {
        var renderCoursePage = component.getEvent("renderCoursePage");
        
        renderCoursePage.setParams({
            "courseId" : component.get("{!v.courseId}")
        });
        
        renderCoursePage.fire();
    },
    hideAccount : function(component,event){
        var hideAccountInfo = component.getEvent("hideAccountInfo");
        hideAccountInfo.setParams({
            "jideAccount" : true
        });
        hideAccountInfo.fire();
    }
})
