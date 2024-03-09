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

function visage_track_element(element){
	__visageController.track_element(element);
}

function visage_remove_tracked_element(element){
	__visageController.remove_tracked_element(element);
}


function visageElement() constructor{
	// Attribute variables
	_x = 0;
	_y = 0;
	_rotation = 0;
	_scale = 1;
	_alpha = 1;
	_isVisible = true;
	_parentElement = noone;
	_subElements = ds_list_create();
	_self = self;
	_elementSprite = noone;
	
	// Drawing variables.
	_leftX = 0;
	_rightX = 0;
	_topY = 0;
	_bottomY = 0;
	_totalWidth = 0;
	_totalHeight = 0;
	_elementLeftDrawOffset = 0;
	_elementTopDrawOffset = 0; 
	_elementDrawWidth = 0;
	_elementDrawHeight = 0;
	_elementSurface = noone;
	
	randomize();
	_debugColor = make_color_hsv(irandom(255), irandom_range(127, 255), 255);
	
	/// @method _draw()
	/// @desc [Internal] Drawing logic for animations and other data. This is called internally and should not be called manually.
	/// @returns {null}
	_draw = function(){
		
		for (var i = 0; i < ds_list_size(_subElements); i++){
			_subElements[| i]._draw();
		}
			
		surface_set_target(_elementSurface);
		draw_clear_alpha(c_black, 0);
		draw_clear_alpha(_debugColor, 1);//Remove this line
		drawElement();
		for (var i = 0; i < ds_list_size(_subElements); i++){
			with (_subElements[| i]){
				if (surface_exists(_elementSurface)){
					draw_surface_part_ext(_elementSurface, _elementLeftDrawOffset, _elementTopDrawOffset, _elementDrawWidth, _elementDrawHeight, (_leftX - other._leftX) + other._x, (_topY - other._topY) + other._y, 1, 1, c_white, 1);
				}
			}
				
		}
		surface_reset_target();
		
		if (_parentElement = noone){
			sprite_delete(_elementSprite);
			_elementSprite = sprite_create_from_surface(_elementSurface, 0, 0, surface_get_width(_elementSurface), surface_get_height(_elementSurface), false, false, -_leftX, -_topY)
			draw_sprite_ext(_elementSprite, 0, _x, _y, _scale, _scale, _rotation, c_white, _alpha);
		}
	}

	#region // Input handleing methods
	/// @method handleMouseClickLeftPressed()
	/// @desc [Internal] Handles input for left click press
	/// @returns {null}
	_handleMouseClickLeftPressed = function(){
		var i = 0;
		show_debug_message("Called from " + string(instanceof(self)) + " line: " + string(array_pop(string_split(debug_get_callstack()[0], ":"))));
		while (i < ds_list_size(_subElements)){
			_subElements[| i]._handleMouseClickLeftPressed();
			i++;
		}
	}
	
	/// @method handleMouseClickLeftReleased()
	/// @desc [Internal] Handles input for left click release
	/// @returns {null}
	_handleMouseClickLeftReleased = function(){
		var i = 0;
		show_debug_message("Called from " + string(instanceof(self)) + " line: " + string(array_pop(string_split(debug_get_callstack()[0], ":"))));
		while (i < ds_list_size(_subElements)){
			_subElements[| i]._handleMouseClickLeftReleased();
			i++;
		}
	}
	
	/// @method handleMouseClickRightPressed()
	/// @desc [Internal] Handles input for right click press
	/// @returns {null}
	_handleMouseClickRightPressed = function(){
		var i = 0;
		show_debug_message("Called from " + string(instanceof(self)) + " line: " + string(array_pop(string_split(debug_get_callstack()[0], ":"))));
		while (i < ds_list_size(_subElements)){
			_subElements[| i]._handleMouseClickRightPressed();
			i++;
		}
	}
	
	/// @method handleMouseClickRightReleased()
	/// @desc [Internal] Handles input for right click release
	/// @returns {null}
	_handleMouseClickRightReleased = function(){
		var i = 0;
		show_debug_message("Called from " + string(instanceof(self)) + " line: " + string(array_pop(string_split(debug_get_callstack()[0], ":"))));
		while (i < ds_list_size(_subElements)){
			_subElements[| i]._handleMouseClickRightReleased();
			i++;
		}
	}
	
	/// @method handleMouseClickMiddlePressed()
	/// @desc [Internal] Handles input for middle click press
	/// @returns {null}
	_handleMouseClickMiddlePressed = function(){
		var i = 0;
		show_debug_message("Called from " + string(instanceof(self)) + " line: " + string(array_pop(string_split(debug_get_callstack()[0], ":"))));
		while (i < ds_list_size(_subElements)){
			_subElements[| i]._handleMouseClickMiddlePressed();
			i++;
		}
	}
	
	/// @method handleMouseClickMiddleReleased()
	/// @desc [Internal] Handles input for middle click release
	/// @returns {null}
	_handleMouseClickMiddleReleased = function(){
		var i = 0;
		show_debug_message("Called from " + string(instanceof(self)) + " line: " + string(array_pop(string_split(debug_get_callstack()[0], ":"))));
		while (i < ds_list_size(_subElements)){
			_subElements[| i]._handleMouseClickMiddleReleased();
			i++;
		}
	}
	
	/// @method handleMouseWheelUp()
	/// @desc [Internal] Handles input for scroll wheel up
	/// @returns {null}
	_handleMouseWheelUp = function(){
		var i = 0;
		show_debug_message("Called from " + string(instanceof(self)) + " line: " + string(array_pop(string_split(debug_get_callstack()[0], ":"))));
		while (i < ds_list_size(_subElements)){
			_subElements[| i]._handleMouseWheelUp();
			i++;
		}
	}
	
	/// @method handleMouseWheelDown()
	/// @desc [Internal] Handles input for scroll wheel down
	/// @returns {null}
	_handleMouseWheelDown = function(){
		var i = 0;
		show_debug_message("Called from " + string(instanceof(self)) + " line: " + string(array_pop(string_split(debug_get_callstack()[0], ":"))));
		while (i < ds_list_size(_subElements)){
			_subElements[| i]._handleMouseWheelDown();
			i++;
		}
	}
	#endregion
	
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