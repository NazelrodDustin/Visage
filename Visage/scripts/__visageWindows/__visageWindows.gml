/// @title Windows
/// @category Documentation

/// @text Similar to a Container, the Window contains a group of GUI elements. The Window has potential of being moved, resized, closed, minimized, and restored. Each of these features can be configured as enabled or disabled. Resizing a window will not change the scale of elements inside of the window, but may allow other elements to expand or contract if elements are configured to behave as such.<br>

/// @constructor
/// @func visageWindow()
function visageWindow() : visageElement() constructor{
	_x = 0;
	_y = 0;
	_width = 128;
	_height = 64;
	_isResizable = false;
	_isMinimizable = false;
	_isMoveable = false;
	_isVisible = true;
	_isFocused = false;
	_parentElement = noone;	
	_subElements = ds_list_create();
	_self = self;
	
	_focusedSprite = spr_default9SliceFocused
	_unfocusedSprite = spr_default9SliceUnfocused
	
	_update = function(){
		
	}
	
	getElementSize = function(){
		_leftX = 0;
		_rightX = _width;
		_topY = 0;
		_bottomY = _height;
		_totalWidth = 0;
		_totalHeight = 0;
	}
	
	getElementVisibleDimensions = function(){
		_elementLeftDrawOffset = 0;
		_elementTopDrawOffset = 0; 
		_elementDrawWidth = _totalWidth;
		_elementDrawHeight = _totalHeight;	
	}
	
	/// @method drawElement()
	/// @desc Drawing logic for this element to be called in _draw()
	/// @returns {null}
	drawElement = function(){
		draw_sprite_stretched(_isFocused ? _focusedSprite : _unfocusedSprite, 0, -_leftX, -_topY, _width, _height);
	}	

	
}

