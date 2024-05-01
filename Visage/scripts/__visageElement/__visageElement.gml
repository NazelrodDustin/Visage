/// @title Elements
/// @category Documentation

/// @text Visage is composed of elements. The methods listed here are shared by all elements. 

function visageElement() constructor{
	
	#region // Variable Initialization.
	
	// Common Attribute Variables.
	_x = 0; // X and Y variables do not change with alignment. Instead they are the origin of the element.
	_y = 0; // Any sub element positions will be converted to local coordinates.
	_width = 1; // The following variables may not be editable for all elements...
	_height = 1; // ...Only to be used as default values, in the event the element is the parent.
	_rotation = 0;
	_scale = 1;
	_alpha = 1;
	_isVisible = true;
	_isFocused = false;
	_alignment = VISAGE_ALIGNMENT.TOP_LEFT;
	_inputMap = array_create(0); // Input map for this element.
	_verticalGuides = array_create(0); // Verticle guide lines for aligning sub elements around this element
	_horizontalGuides = array_create(0); // Horizontal version
	
	// Unique Element Attribute Variables.
	_parentElement = noone; // All of these variables are used by all elements.
	_subElements = array_create(0);
	_priority = infinity; 
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


	// Debug Variables
	_debugColor = c_black;
	if (VISAGE_DEBUG){
		var seed = random_get_seed()
		randomize();
		_debugColor = make_color_hsv(irandom(255), irandom_range(128, 255), irandom_range(64, 255));
		random_set_seed(seed)
	}
	
	#endregion
	
	#region // Method Declaration.
	
	#region // Internal Methods.
	
	/// @ignore true
	
	#region /// @method _incrementSort(priority, element)
	/// @desc [Internal] Increments and sorts elements above a certain threshold
	/// @param {real} priority The minimum priority to update 
	/// @param {stuct}element The element that has invoked the initial incrementSort call
	/// @returns {null}
	_incrementSort = function(_priorityLevel, _element){
		if (_element != self){
			if (_priority >= _priorityLevel){
				_priority++;
				for (var i = 0; i < array_length(_subElements); i++){
					_subElements[i]._incrementSort(_priorityLevel, _element);
				}
			}
		}
		if (array_length(_subElements) > 0){
			array_sort(_subElements, _visagePrioritySort);
			_priority = min(_priority, _subElements[0]._priority);
		}
	}
	#endregion
	
	#region /// @method _updateSystem()
	/// @desc [Internal] Calls updateSystem function for all sub elements, runs own _updateElement logic.
	/// @returns {null}
	_updateSystem = function(){
		_preUpdateElement();
		
		for (var i = 0; i < array_length(_subElements); i++){
			_subElements[i]._updateSystem();
		}
		
		_updateElement();
		
		for (var i = 0; i < array_length(_subElements); i++){
			_subElements[i]._postUpdateElement();
		}
		
		
	}
	#endregion
	
	#region /// @method _preUpdateElement()
	/// @desc Runs pre update logic for Element  
	/// @returns {null}
	_preUpdateElement = function(){
		if (VISAGE_DEBUG){
			_visageLog("This is being called from the visageElement parent.\nIf this is appearing in the console, you are not creating a _preUpdateElement function.\nIf the element does not require an _preUpdateElement function, you may ignore this message.\nOtherwise use create an _preUpdateElement function to be included in the system update logic.", true);
		}	
	}#endregion
	
	#region /// @method _updateElement()
	/// @desc [Internal] Updates element variables. This is provded as a default function body, but the expectation is to replace this with per element update logic.
	/// @returns {null}
	_updateElement = function(){
		if (VISAGE_DEBUG){
			_visageLog("This is being called from the visageElement parent.\nIf this is appearing in the console, you are not creating a _updateElement function.\nIf the element does not require an _updateElement function, you may ignore this message.\nOtherwise use create an _updateElement function to be included in the system update logic.", true);
		}
	}
	#endregion
	
		#region /// @method _postUpdateElement()
	/// @desc Runs post update logic for Element
	/// @returns {null}
	_postUpdateElement = function(){
		if (VISAGE_DEBUG){
			_visageLog("This is being called from the visageElement parent.\nIf this is appearing in the console, you are not creating a _postUpdateElement function.\nIf the element does not require an _postUpdateElement function, you may ignore this message.\nOtherwise use create an _postUpdateElement function to be included in the system update logic.", true);
		}	
	}#endregion
	
	#region /// @method _drawSystem()
	/// @desc [Internal] Drawing logic for animations and other data. This is called internally and should not be called manually.
	/// @returns {null}
	_drawSystem = function(){
		for (var i = 0; i < array_length(_subElements); i++){
			_subElements[i]._drawSystem();
		}
		
		if (surface_exists(_elementSurface)){
			
			surface_set_target(_elementSurface);
		
			draw_clear_alpha(c_black, 0);
		
			if (VISAGE_DEBUG && VISAGE_DEBUG_DRAW){
				 draw_clear_alpha(_debugColor, 1);
			}
		
			_drawElement();
			surface_reset_target();
			
			if (_parentElement = noone){
				sprite_delete(_elementSprite);
				_elementSprite = sprite_create_from_surface(_elementSurface, 0, 0, surface_get_width(_elementSurface), surface_get_height(_elementSurface), false, false, _x - _leftX, _y - _topY)
				draw_sprite_ext(_elementSprite, 0, _x, _y, _scale, _scale, _rotation, c_white, _alpha);
			}
			
			for (var i = 0; i < array_length(_subElements); i++){
				with (_subElements[i]){
					if (surface_exists(_elementSurface)){
						var _angle = degtorad(-_rotation);
						
						var _rotatedX = _elementLeftX * cos(_angle) - _elementTopY * sin(_angle);
						var _rotatedY = _elementLeftX * sin(_angle) + _elementTopY * cos(_angle);
						
						var _drawX = _x + _rotatedX;
						var _drawY = _y + _rotatedY;
						draw_surface_general(_elementSurface, _elementLeftDrawOffset, _elementTopDrawOffset, _elementDrawWidth, _elementDrawHeight, _drawX, _drawY, _scale, _scale, _rotation, c_white, c_white, c_white, c_white, _alpha);
					}
				}
				
			}
			
			
						


			
			draw_set_color(c_white);
			draw_rectangle(_x - 5, _y - 5, _x + 5, _y + 5, false);
			draw_set_color(c_white);
			
		}

	}
	#endregion
	
	#region /// @method _drawElement()
	/// @desc [Internal] Draws element. This is provded as a default function body, but the expectation is to replace this with per element update logic.
	/// @returns {null}
	_drawElement = function(){
		if (VISAGE_DEBUG){
			_visageLog("This is being called from the visageElement parent.\nIf this is appearing in the console, you are not creating a _drawElement function.\nIf the element does not require an _drawElement function, you may ignore this message.\nOtherwise use create an _drawElement function to be included in the system draw logic.", true);
		}
	}
	#endregion
		
	#region /// @method _onInput(event)
	/// @desc [Internal] Handles input information.
	/// @param {struct} event The input event.
	/// @returns {null}
	_onInput = function(_event){
		if (_isFocused){
			for (var i = 0; i < array_length(_subElements); i++){
				_subElements[i]._onInput();
			}
			_updateElement();
		}
	}

	#endregion

	#region /// @method _onFocus()
	/// @desc [Internal] Sets this element, and all sub elements as focused.
	/// @returns {null}
	
	#endregion
	
	#region /// @method _onFocusLost()
	/// @desc [Internal] Sets this element, and all sub elements as unfocused.
	/// @returns {null}
	
	#endregion
	/// @ignore false
	#endregion
	
	#region // Public Methods.


	#region /// @method addSubElement(element)
	/// @desc Adds a sub element to be tracked by this element.
	/// @param {struct} element The element to add to be tracked.
	/// @returns {null}
	addSubElement = function(_element){
		array_push(_subElements, _element);
		_element._parentElement = _self;
	}
	#endregion
	
	#region /// @method removeSubElement(element)
	/// @desc Removes a sub element from being tracked by this element.
	/// @param {struct} element The element to remove from being tracked.
	/// @returns {null}
	removeSubElement = function(_element){
		for (var i = 0; i < array_length(_subElements); i++) {
			if (elementFound){
				_subElements[i - 1] = _subElements[i];	
			}else{
				elementFound = (element == _subElements[i]);
			}
		}
	}
	#endregion

	#region /// @method setPriority(priority)
	/// @desc Sets priority of element then increments all element of the same priority or higher.
	/// @param {real} priority The new element priority to set.
	/// @returns {null}
	setPriority = function(_newPriority = 1){
		if (_newPriority < 1){
			_newPriority = 1;	
		}
		_priority = _newPriority;
		_visageIncrementSort(_newPriority, _self);
	}
	#endregion
	
	#endregion
	
	#endregion
}