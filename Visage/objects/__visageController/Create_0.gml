/// @description Insert description here
// You can write your code in this editor

trackedElements = ds_list_create();

function track_element(element){
	ds_list_add(trackedElements, element);
}

function remove_tracked_element(element){
	ds_list_delete(trackedElements, element);	
}

