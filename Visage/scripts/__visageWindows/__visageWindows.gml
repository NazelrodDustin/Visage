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
	_parentElement = noone;	
	_subElements = ds_list_create();
	_self = self;
	
	_focusedSprite = spr_default9SliceFocused
	_unfocusedSprite = spr_default9SliceUnfocused
	
	
	// Drawing variables.
	_leftX = infinity;
	_rightX = -infinity;
	_topY = infinity;
	_bottomY = -infinity;
	_totalWidth = -infinity;
	_totalHeight = -infinity;
	_elementLeftDrawOffset = 0;
	_elementTopDrawOffset = 0; 
	_elementDrawWidth = 0;
	_elementDrawHeight = 0;
	_elementSurface = noone;
	
	_update = function(){
		
	}
	
	_draw = function(){
		
		for (var i = 0; i < ds_list_size(_subElements); i++){
			_subElements[| i]._draw();
		}
		
		var _oldWidth = _totalWidth;
		var _oldHeight = _totalHeight;
			
		_leftX = 0;
		_rightX = _width;
		_topY = 0;
		_bottomY = _height;
		_totalWidth = 0;
		_totalHeight = 0;
	
		for (var i = 0; i < ds_list_size(_subElements); i++){
			var subElement = _subElements[| i];
			_leftX = min(_leftX, subElement._x, subElement._leftX);
			_rightX = max(_rightX, subElement._x + subElement._totalWidth);
			_topY = min(_topY, subElement._y, subElement._topY);
			_bottomY = max(_bottomY, subElement._y + subElement._totalHeight);
		}
		
		_totalWidth = _rightX - _leftX;
		_totalHeight = _bottomY - _topY;
		
		_elementLeftDrawOffset = 0;
		_elementTopDrawOffset = 0; 
		_elementDrawWidth = _totalWidth;
		_elementDrawHeight = _totalHeight;
			
		if (((_oldWidth != _totalWidth) || (_oldHeight != _totalHeight)) || !surface_exists(_elementSurface)){
			if (surface_exists(_elementSurface)){
				surface_resize(_elementSurface, _totalWidth, _totalHeight);
			}else{
				_elementSurface = surface_create(_totalWidth, _totalHeight);
			}
		}
			
		surface_set_target(_elementSurface);
		draw_clear_alpha(c_black, 0);
		draw_sprite_stretched(_isFocused ? _focusedSprite : _unfocusedSprite, 0, -_leftX, -_topY, _width, _height);
		for (var i = 0; i < ds_list_size(_subElements); i++){
			with (_subElements[| i]){
				if (surface_exists(_elementSurface)){
					draw_surface_part_ext(_elementSurface, _elementLeftDrawOffset, _elementTopDrawOffset, _elementDrawWidth, _elementDrawHeight, (_leftX + _x) - other._leftX, (_topY + _y) - other._topY, 1, 1, c_white, 1.0);
				}
			}
				
		}
		surface_reset_target();
		
		if (_parentElement = noone){
			var testSpr = sprite_create_from_surface(_elementSurface, 0, 0, surface_get_width(_elementSurface), surface_get_height(_elementSurface), false, false, -_leftX, -_topY)
			draw_sprite_ext(testSpr, 0, _x, _y, _scale, _scale, _rotation, c_white, _alpha);
		}
	}
	
	
	
	
	/// @method addSubElement(element)
	/// @desc Adds a sub element to be tracked by this element.
	/// @param {struct} element The element to add to be tracked.
	/// @returns {null}
	addSubElement = function(_element){
		ds_list_add(_subElements, _element);
		_element._parentElement = _self;
	}
	
	/// @method removeSubElement(element)
	/// @desc Removes a sub element from being tracked by this element.
	/// @param {struct} element The element to remove from being tracked.
	/// @returns {null}
	removeSubElement = function(_element){
		ds_list_delete(_subElements, ds_list_find_index(_subElements, _element));
	}

	
}

