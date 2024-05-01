/// @description Insert description here
// You can write your code in this editor

if (instance_number(_visageController) > 1){
	instance_destroy();	
}

trackedElements = array_create();

function _trackElement(element){
	array_push(trackedElements, element);
}

function _removeTrackedElement(element){
	var elementFound = false;
	for (var i = 0; i < array_length(trackedElements); i++) {
		if (elementFound){
			trackedElements[i - 1] = trackedElements[i];	
		}else{
			elementFound = (element == trackedElements[i]);
		}
	}
}

function _incrementSort(priority, element){
	for (var i = 0; i < array_length(trackedElements); i++) {
		trackedElements[i]._incrementSort(priority, element);
	}
		
	array_sort(trackedElements, _visagePrioritySort);
}