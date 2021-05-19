({
    getThisContent : function(component,event) {
        var renderEvent = component.getEvent("renderEvent");
        renderEvent.setParams({
            "contentId" : component.get("{!v.recordId}"),
            "contentType" : component.get("{!v.contentType}")
        });
        renderEvent.fire();
    }
})
