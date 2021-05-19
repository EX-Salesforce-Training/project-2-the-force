({
	navigate : function(component, event, helper) {
		var divList = [
			component.find("Shop"),
			component.find("Home"),
			component.find("Account"),
			component.find("Careers")
		];

		for(let i=0; i<divList.length; i++){
			let displayDiv = divList[i];
			$A.util.addClass(displayDiv,"toggle-hide");
		};

		var navTo = event.getParam("page");
		console.log("Event Recieved")

		switch (navTo){
			case "Shop":
				var displayDiv = component.find("Shop");
				$A.util.removeClass(displayDiv,"toggle-hide");
				break;
			case "Home":
				var displayDiv = component.find("Home");
				$A.util.removeClass(displayDiv,"toggle-hide");
				break;
			case "LearnerPortal":
				var displayDiv = component.find("Account");
				$A.util.removeClass(displayDiv,"toggle-hide");
				break;
			case "Careers":
				var displayDiv = component.find("Careers");
				$A.util.removeClass(displayDiv,"toggle-hide");
				break;

		}

	}
})