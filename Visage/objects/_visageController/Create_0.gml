/// @description Insert description here
// You can write your code in this editor

if (instance_number(_visageController) > 1){
	instance_destroy();	
}

_trackedElements = array_create();
_deltaTime = 0;
function _trackElement(element){
	var arrayContainsElement = false;
	for (var i = 0; i < array_length(_trackedElements) && !arrayContainsElement; i++){
		if (element == _trackedElements[i]){
			arrayContainsElement = true;
		}
	}
	if (arrayContainsElement){
		array_push(_trackedElements, element);
	}
}

function _removeTrackedElement(element){
	var elementFound = false;
	for (var i = 0; i < array_length(_trackedElements); i++) {
		if (elementFound){
			_trackedElements[i - 1] = _trackedElements[i];	
		}else{
			elementFound = (element == _trackedElements[i]);
		}
	}
}

function _incrementSort(priority, element){
	for (var i = 0; i < array_length(_trackedElements); i++) {
		_trackedElements[i]._incrementSort(priority, element);
	}
		
	array_sort(_trackedElements, _visagePrioritySort);
}