function goToTab(tab){
	for(var i = tab+1; i<5; i ++){
		document.getElementById("tab"+i).classList.add("disabled");
	}
}
function jumpToTab(tab){
	var tabElement = document.getElementById("tab"+tab);
	tabElement.classList.remove("disabled");
	goToTab(tab);
	
}