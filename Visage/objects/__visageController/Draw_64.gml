/// @description Insert description here
// You can write your code in this editor

var i = 0;
while (i < ds_list_size(trackedElements)){
	trackedElements[| i ]._draw();
	i++;
}