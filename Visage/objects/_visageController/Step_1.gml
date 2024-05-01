/// @description Insert description here
// You can write your code in this editor

for (var i = 0; i < array_length(trackedElements); i++){
	trackedElements[i]._updateSystem();
	trackedElements[i]._postUpdateElement();
}
/*
if (mouse_check_button_pressed(mb_left)){
	for (var i = 0; i < array_length(trackedElements); i++){
		trackedElements[i]._handleMouseClickLeftPressed();
		i++;
	}
}

if (mouse_check_button_released(mb_left)){
	for (var i = 0; i < array_length(trackedElements); i++){
		trackedElements[i]._handleMouseClickLeftReleased();
		i++;
	}
}

if (mouse_check_button_pressed(mb_right)){
	for (var i = 0; i < array_length(trackedElements); i++){
		trackedElements[i]._handleMouseClickRightPressed();
		i++;
	}
}

if (mouse_check_button_released(mb_right)){
	for (var i = 0; i < array_length(trackedElements); i++){
		trackedElements[i]._handleMouseClickRightReleased();
		i++;
	}
}

if (mouse_check_button_pressed(mb_middle)){
	for (var i = 0; i < array_length(trackedElements); i++){
		trackedElements[i]._handleMouseClickMiddlePressed();
		i++;
	}
}

if (mouse_check_button_released(mb_middle)){
	for (var i = 0; i < array_length(trackedElements); i++){
		trackedElements[i]._handleMouseClickMiddleReleased();
		i++;
	}
}

if (mouse_wheel_up()){
	for (var i = 0; i < array_length(trackedElements); i++){
		trackedElements[i]._handleMouseWheelUp();	
		i++;
	}
}

if (mouse_wheel_down()){
	for (var i = 0; i < array_length(trackedElements); i++){
		trackedElements[i]._handleMouseWheelDown();	
		i++;
	}
}

