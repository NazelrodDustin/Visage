/// @description Insert description here
// You can write your code in this editor

var i = 0;
while (i < ds_list_size(trackedElements)){
	trackedElements[| i ]._update();
	i++;
}

if (mouse_check_button_pressed(mb_left)){
	i = 0;
	while (i < ds_list_size(trackedElements)){
		trackedElements[| i]._handleMouseClickLeftPressed();
		i++;
	}
}

if (mouse_check_button_released(mb_left)){
	i = 0;
	while (i < ds_list_size(trackedElements)){
		trackedElements[| i]._handleMouseClickLeftReleased();
		i++;
	}
}

if (mouse_check_button_pressed(mb_right)){
	i = 0;
	while (i < ds_list_size(trackedElements)){
		trackedElements[| i]._handleMouseClickRightPressed();
		i++;
	}
}

if (mouse_check_button_released(mb_right)){
	i = 0;
	while (i < ds_list_size(trackedElements)){
		trackedElements[| i]._handleMouseClickRightReleased();
		i++;
	}
}

if (mouse_check_button_pressed(mb_middle)){
	i = 0;
	while (i < ds_list_size(trackedElements)){
		trackedElements[| i]._handleMouseClickMiddlePressed();
		i++;
	}
}

if (mouse_check_button_released(mb_middle)){
	i = 0;
	while (i < ds_list_size(trackedElements)){
		trackedElements[| i]._handleMouseClickMiddleReleased();
		i++;
	}
}

if (mouse_wheel_up()){
	i = 0;
	while (i < ds_list_size(trackedElements)){
		trackedElements[| i]._handleMouseWheelUp();	
		i++;
	}
}

if (mouse_wheel_down()){
	i = 0;
	while (i < ds_list_size(trackedElements)){
		trackedElements[| i]._handleMouseWheelDown();	
		i++;
	}
}

