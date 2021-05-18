({
    fireRemoveEvent : function(component,event) {
        let removeEvent = component.getEvent("removeFromCartEvent");
        let courseID = component.get("{!v.courseID}");

        removeEvent.setParams({"courseId": courseID});
        removeEvent.fire();
    }
})
