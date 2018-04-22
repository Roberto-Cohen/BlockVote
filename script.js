function goToTab(tab){
	for(var i = tab+1; i<5; i ++){
		//document.getElementById("tab"+i).classList.add("disabled");
	}
	//jumpToTab(tab);
}
function jumpToTab(tab){
	var instance = M.Tabs.getInstance(document.getElementById("tabs"));
	var tabElement = document.getElementById("tab"+tab);
	tabElement.classList.remove("disabled");
	goToTab(tab);
	instance.select("tab"+tab);
}