/// @title Elements
/// @category Documentation

/// @text Visage is composed of elements. The methods listed here are shared by all elements. 

/// @constructor
/// @function visageElement()
function visageElement() constructor{
	
	#region // Variable Initialization.
	
	// Common Attribute Variables.
	transform = new visageTransform();
	animation = new visageAnimation();
	_isVisible = true;
	_isFocused = false;
	_inputMap = array_create(0); // Input map for this element.
	_verticalGuides = array_create(0); // Verticle guide lines for aligning sub elements around this element
	_horizontalGuides = array_create(0); // Horizontal version
	_transformationMatrix = matrix_build(0, 0, 0, 0, 0, 0, 1, 1, 1);
	_alpha = 1;
	
	_bounds = array_create(8, 0);
	_mouseInside = false;
	
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
	
	/// @ignore true
	#region // Internal Methods.
	
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
		_updateElement();
		
		for (var i = 0; i < array_length(_subElements); i++){
			_subElements[i]._updateSystem();
		}	
	}
	#endregion
	
	#region /// @method _translateMatrixTransform(matrix, transform)
	/// @desc [Internal] Modifies a matrix using the translation component of a transform.
	/// @param {array} matrix The matrix to modify.
	/// @param {struct} transform The transform to get the translation component of.
	_translateMatrixTransform = function(matrix, transform){
		return matrix_multiply(matrix_build(transform.translation.x, transform.translation.y, 0, 0, 0, 0, 1, 1, 1), matrix);
	}
	#endregion
	
	#region /// @method _scaleMatrixTransform(matrix, transform)
	/// @desc [Internal] Modifies a matrix using the scale component of a transform.
	/// @param {array} matrix The matrix to modify.
	/// @param {struct} transform The transform to get the scale component of.
	_scaleMatrixTransform = function(matrix, transform){
		return matrix_multiply(matrix_build(0, 0, 0, 0, 0, 0, transform.scale.x, transform.scale.y, 1), matrix);
	}
	#endregion
	
	#region /// @method _rotateMatrixTransform(matrix, transform)
	/// @desc [Internal] Modifies a matrix using the rotation component of a transform.
	/// @param {array} matrix The matrix to modify.
	/// @param {struct} transform The transform to get the rotation component of.
	_rotateMatrixTransform = function(matrix, transform){
		return matrix_multiply(matrix_build(0, 0, 0, 0, 0, transform.rotation, 1, 1, 1), matrix);
	}
	#endregion
	
	#region /// @method _updateElement()
	/// @desc [Internal] Updates element variables. This is provded as a default function body, but the expectation is to replace this with per element update logic.
	/// @returns {null}
	_updateElement = function(){
		if (VISAGE_DEBUG){
			//_visageLog("This is being called from the visageElement parent.\nIf this is appearing in the console, you are not creating a _updateElement function.\nIf the element does not require an _updateElement function, you may ignore this message.\nOtherwise use create an _updateElement function to be included in the system update logic.", true);
			if (animation.started() && !animation.isFinished()){
				var animTransform = animation.getTransform();
				transform.copy(animTransform);
				_visageLog(transform);
			}
			
			_transformationMatrix = matrix_build(0, 0, 0, 0, 0, 0, 1, 1, 1);
			_alpha = 1;
	
			var hierarchyStack = ds_stack_create();
			var _element = _parentElement;
			while (_element != noone){
				ds_stack_push(hierarchyStack, _element);
				_element = _element._parentElement;
			}
			
			while (!ds_stack_empty(hierarchyStack)){
				_element = ds_stack_pop(hierarchyStack);
				_transformationMatrix = _translateMatrixTransform(_transformationMatrix, _element.transform);
				_transformationMatrix = _rotateMatrixTransform(_transformationMatrix, _element.transform);
				_transformationMatrix = _scaleMatrixTransform(_transformationMatrix, _element.transform);
				_alpha *= _element.transform.alpha;
			}
			
			_transformationMatrix = _translateMatrixTransform(_transformationMatrix, transform);
			_transformationMatrix = _rotateMatrixTransform(_transformationMatrix, transform);
			_transformationMatrix = _scaleMatrixTransform(_transformationMatrix, transform);
			_alpha *= transform.alpha;
		}
		
		_bounds = matrix_transform_vertex(_transformationMatrix, -64, -64, 0);
		array_pop(_bounds);
		array_copy(_bounds, 2, matrix_transform_vertex(_transformationMatrix, -64, 64, 0), 0, 2);
		array_copy(_bounds, 4, matrix_transform_vertex(_transformationMatrix, 64, -64, 0), 0, 2);
		array_copy(_bounds, 6, matrix_transform_vertex(_transformationMatrix, 64, 64, 0), 0, 2);
		
		_mouseInside = (point_in_triangle(mouse_x, mouse_y, _bounds[0], _bounds[1], _bounds[2], _bounds[3], _bounds[4], _bounds[5]) || point_in_triangle(mouse_x, mouse_y, _bounds[6], _bounds[7], _bounds[4], _bounds[5], _bounds[2], _bounds[3]));
	}#endregion
	
	#region /// @method _drawSystem()
	/// @desc [Internal] Drawing logic for animations and other data. This is called internally and should not be called manually.
	/// @returns {null}
	_drawSystem = function(){
		_drawElement()
		for (var i = 0; i < array_length(_subElements); i++){
			_subElements[i]._drawSystem();
		}
	}#endregion
	
	#region /// @method _drawElement()
	/// @desc [Internal] Draws element. This is provded as a default function body, but the expectation is to replace this with per element update logic.
	/// @returns {null}
	_drawElement = function(){
		if (VISAGE_DEBUG){

			//_visageLog("This is being called from the visageElement parent.\nIf this is appearing in the console, you are not creating a _drawElement function.\nIf the element does not require an _drawElement function, you may ignore this message.\nOtherwise use create an _drawElement function to be included in the system draw logic.", true);
			if (_parentElement == noone){
				draw_sprite_ext(spr_node, 0, transform.translation.x, transform.translation.y, 1, 1, transform.rotation, c_white, _alpha);
			}else{
				matrix_set(matrix_world, _transformationMatrix);
				draw_sprite_ext(spr_icon, 0, 0, 0, 1, 1, 0, c_white, _alpha);
			}
			matrix_set(matrix_world, matrix_build_identity());
			
			draw_set_color(_debugColor);
			draw_triangle(_bounds[0], _bounds[1], _bounds[2], _bounds[3], _bounds[4], _bounds[5], !_mouseInside);
			draw_triangle(_bounds[6], _bounds[7], _bounds[4], _bounds[5], _bounds[2], _bounds[3], !_mouseInside);
			draw_set_color(c_white);
			
		}
	}#endregion
	
	#region /// @method _onInput(event)
	/// @desc [Internal] Handles input information.
	/// @param {struct} event The input event.
	/// @returns {null}
	_onInput = function(_event){
		if (_isFocused){
			for (var i = 0; i < array_length(_subElements); i++){
				_subElements[i]._onInput(_event);
			}
			_updateElement();
		}
	}#endregion

	#region /// @method _onFocus()
	/// @desc [Internal] Sets this element, and all sub elements as focused.
	/// @returns {null}
	
	#endregion
	
	#region /// @method _onFocusLost()
	/// @desc [Internal] Sets this element, and all sub elements as unfocused.
	/// @returns {null}
	#endregion
	
	#endregion
	
	/// @ignore false
	
	#region // Public Methods.


	#region /// @method addSubElement(element)
	/// @desc Adds a sub element to be tracked by this element.
	/// @param {struct} element The element to add to be tracked.
	/// @returns {null}
	addSubElement = function(_element){
		array_push(_subElements, _element);
		_element._parentElement = _self;
	}#endregion
	
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
	}#endregion

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
	}#endregion
	
	#endregion
	
	#endregion
}