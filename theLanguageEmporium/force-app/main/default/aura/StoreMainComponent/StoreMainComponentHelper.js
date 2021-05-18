({
    addNewItem : function(component,event) {
        var currentCartList = component.get("{!v.shoppingCartItems}");

        var newItem = event.getParam("courseId");
        currentCartList.push(newItem);

        component.set("{!v.shoppingCartItems}", currentCartList);
    }
})
