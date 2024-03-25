enum VISAGE_ALIGNMENT {
	TOP_LEFT,
	TOP_CENTER,
	TOP_RIGHT,
	MIDDLE_LEFT,
	MIDDLE_CENTER,
	MIDDLE_RIGHT,
	BOTTOM_LEFT,
	BOTTOM_CENTER,
	BOTTOM_RIGHT
}

function visage_track_element(element){
	__visageController.track_element(element);
}

function visage_remove_tracked_element(element){
	__visageController.remove_tracked_element(element);
}
