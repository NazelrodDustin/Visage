/// @title Windows
/// @category Documentation

/// @text Similar to a Container, the Window contains a group of GUI elements. The Window has potential of being moved, resized, closed, minimized, and restored. Each of these features can be configured as enabled or disabled. Resizing a window will not change the scale of elements inside of the window, but may allow other elements to expand or contract if elements are configured to behave as such.<br>

/// @constructor
/// @func visageWindow()
function visageWindow() constructor{
	_x = 0;
	_y = 0;
	_width = 128;
	_height = 64;
	_isResizable = false;
	_isMinimizable = false;
	_isMoveable = false;
	_isVisible = true;
	_isFocused = false;
	_subElements = ds_list_create();

	onClick = function(){
		show_debug_message("This is a test");
	}

	setOnClickCallback = function(_callback){
		onClick = _callback;
	}

}

