({
	navigate : function(component, event, helper) {
		component.set("v.Shop","False");
		component.set("v.Home","False");
		component.set("v.LearnerPortal","False");
		component.set("v.Careers","False");

		var navTo = event.getParam("page");
		console.log("Event Recieved")

		switch (navTo){
			case "Shop":
				console.log("Nav Shop")
				component.set("v.Shop","True");
				break;
			case "Home":
				console.log("Nav Home")
				component.set("v.Home","True");
				break;
			case "LearnerPortal":
				console.log("Nav portal")
				component.set("v.LearnerPortal","True");
				break;
			case "Careers":
				console.log("Nav Carreer")
				component.set("v.Careers","True");
				break;

		}

	}
})