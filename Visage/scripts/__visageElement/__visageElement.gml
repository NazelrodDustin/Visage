/// @title Elements
/// @category Documentation

/// @text Visage is composed of elements. The methods listed here are shared by all elements. 

function visageElement() constructor{
	
	#region // Variable Initialization.
	
	// Common Attribute Variables.
	transform = new visageTransform();
	_isVisible = true;
	_isFocused = false;
	_inputMap = array_create(0); // Input map for this element.
	_verticalGuides = array_create(0); // Verticle guide lines for aligning sub elements around this element
	_horizontalGuides = array_create(0); // Horizontal version
	_transformationMatrix = matrix_build(0, 0, 0, 0, 0, 0, 1, 1, 1);
	_alpha = 1;
	
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
		_updateElement();
		
		for (var i = 0; i < array_length(_subElements); i++){
			_subElements[i]._updateSystem();
		}	
	}
	#endregion
	
	#region /// @method translateMatrixTransform(matrix, transform)
	/// @desc [Internal] Modifies a matrix using the translation component of a transform.
	/// @param {array} matrix The matrix to modify.
	/// @param {struct} transform The transform to get the translation component of.
	translateMatrixTransform = function(matrix, transform){
		return matrix_multiply(matrix_build(transform.translation.x, transform.translation.y, 0, 0, 0, 0, 1, 1, 1), matrix);
	}
	#endregion
	
	#region /// @method scaleMatrixTransform(matrix, transform)
	/// @desc [Internal] Modifies a matrix using the scale component of a transform.
	/// @param {array} matrix The matrix to modify.
	/// @param {struct} transform The transform to get the scale component of.
	scaleMatrixTransform = function(matrix, transform){
		return matrix_multiply(matrix_build(0, 0, 0, 0, 0, 0, transform.scale.x, transform.scale.y, 1), matrix);
	}
	#endregion
	
	#region /// @method rotateMatrixTransform(matrix, transform)
	/// @desc [Internal] Modifies a matrix using the rotation component of a transform.
	/// @param {array} matrix The matrix to modify.
	/// @param {struct} transform The transform to get the rotation component of.
	rotateMatrixTransform = function(matrix, transform){
		return matrix_multiply(matrix_build(0, 0, 0, 0, 0, transform.rotation, 1, 1, 1), matrix);
	}
	#endregion
	
	#region /// @method _updateElement()
	/// @desc [Internal] Updates element variables. This is provded as a default function body, but the expectation is to replace this with per element update logic.
	/// @returns {null}
	_updateElement = function(){
		if (VISAGE_DEBUG){
			//_visageLog("This is being called from the visageElement parent.\nIf this is appearing in the console, you are not creating a _updateElement function.\nIf the element does not require an _updateElement function, you may ignore this message.\nOtherwise use create an _updateElement function to be included in the system update logic.", true);
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
				_transformationMatrix = translateMatrixTransform(_transformationMatrix, _element.transform);
				_transformationMatrix = rotateMatrixTransform(_transformationMatrix, _element.transform);
				_transformationMatrix = scaleMatrixTransform(_transformationMatrix, _element.transform);
				_alpha *= _element.transform.alpha;
			}
			
			_transformationMatrix = translateMatrixTransform(_transformationMatrix, transform);
			_transformationMatrix = rotateMatrixTransform(_transformationMatrix, transform);
			_transformationMatrix = scaleMatrixTransform(_transformationMatrix, transform);
			_alpha *= transform.alpha;
		}
	}
	#endregion
	
	#region /// @method _drawSystem()
	/// @desc [Internal] Drawing logic for animations and other data. This is called internally and should not be called manually.
	/// @returns {null}
	_drawSystem = function(){
		_drawElement()
		for (var i = 0; i < array_length(_subElements); i++){
			_subElements[i]._drawSystem();
		}
	}
	#endregion
	
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
				draw_set_alpha(_alpha);
				draw_sprite(spr_icon, 0, 0, 0);
				draw_set_alpha(1.0);
			}
			matrix_set(matrix_world, matrix_build_identity());
		}
	}
	#endregion
	
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