if (VISAGE_AUTO_INIT){
	global._visageInitTimeSource = time_source_create(time_source_global, 1, time_source_units_frames, _visageInit, [], 1);

	function _visageInit(){
		instance_create_depth(0, 0, 0, _visageController);	
	}

	time_source_start(global._visageInitTimeSource);	
}

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

function visageInitialized(){
	return instance_exists(_visageController);	
}

function visageTrackElement(element){
	_visageController._trackElement(element);
}

function visageRemoveTrackedElement(element){
	_visageController._removeTrackedElement(element);
}

function _visageIncrementSort(priority, element){
	_visageController._incrementSort(priority, element);	
}

function _visagePrioritySort(element1, element2){
	var diff = (element1._priority - element2._priority) * -1;
	
	return sign(diff);
}

function _visageLog(_text, _verboseOnly = false){
	if (VISAGE_DEBUG && (VISAGE_VERBOSE || !_verboseOnly)){
		show_debug_message("Visage: " + string(_text));
	}
}