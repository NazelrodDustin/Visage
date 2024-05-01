/// @title Containers
/// @category Documentation

/// @text Containers are the base for any GUI element. Can control visibility, location, rotation, and scale for an entire group of GUI elements. The container is not a visible element, see window for a visible element with similar properties. <br>

/// @constructor
/// @func visageContainer()

function visageContainer() : visageElement() constructor{
	
	#region //Animation variables
	
	#region //Entrance animation
	_animationEntranceOffset = 0;
	
	_animationEntranceMovementCurve = noone;
	_animationEntranceMovementReversed = false;
	_animationEntranceMovementDuration = 0;
	_animationEntranceMovementOffset = 0;
	_animationEntranceMovementStartX = 0;
	_animationEntranceMovementStartY = 0;
	_animationEntranceMovementEndX = 0;
	_animationEntranceMovementEndY = 0;
	_animationEntranceMovementStartingTime = 0;
	_animationEntranceMovementProgress = 0;
	_animationEntranceMovementIsPlaying = false;
	
	_animationEntranceRotationCurve = noone;
	_animationEntranceRotationReversed = false;
	_animationEntranceRotationDuration = 0;
	_animationEntranceRotationOffset = 0;
	_animationEntranceRotationStart = 0;
	_animationEntranceRotationEnd = 0;
	_animationEntranceRotationStartingTime = 0;
	_animationEntranceRotationProgress = 0;
	_animationEntranceRotationIsPlaying = false;
	
	_animationEntranceScaleCurve = noone;
	_animationEntranceScaleReversed = false;
	_animationEntranceScaleDuration = 0;
	_animationEntranceScaleOffset = 0;
	_animationEntranceScaleStart = 1;
	_animationEntranceScaleEnd = 1;
	_animationEntranceScaleStartingTime = 0;
	_animationEntranceScaleProgress = 0;
	_animationEntranceScaleIsPlaying = false;
	
	_animationEntranceAlphaCurve = noone;
	_animationEntranceAlphaReversed = false;
	_animationEntranceAlphaDuration = 0;
	_animationEntranceAlphaOffset = 0;
	_animationEntranceAlphaStart = 1;
	_animationEntranceAlphaEnd = 1;
	_animationEntranceAlphaStartingTime = 0;
	_animationEntranceAlphaProgress = 0;
	_animationEntranceAlphaIsPlaying = false;
	#endregion
	
	#region //Exit animation
	_animationExitOffset = 0;
	
	_animationExitMovementCurve = noone;
	_animationExitMovementReversed = false;
	_animationExitMovementDuration = 0;
	_animationExitMovementOffset = 0;
	_animationExitMovementStartX = 0;
	_animationExitMovementStartY = 0;
	_animationExitMovementEndX = 0;
	_animationExitMovementEndY = 0;
	_animationExitMovementStartingTime = 0;
	_animationExitMovementProgress = 0;
	_animationExitMovementIsPlaying = false;
	
	_animationExitRotationCurve = noone;
	_animationExitRotationReversed = false;
	_animationExitRotationDuration = 0;
	_animationExitRotationOffset = 0;
	_animationExitRotationStart = 0;
	_animationExitRotationEnd = 0;
	_animationExitRotationStartingTime = 0;
	_animationExitRotationProgress = 0;
	_animationExitRotationIsPlaying = false;

	_animationExitScaleCurve = noone;
	_animationExitScaleReversed = false;
	_animationExitScaleDuration = 0;
	_animationExitScaleOffset = 0;
	_animationExitScaleStart = 1;
	_animationExitScaleEnd = 1;
	_animationExitScaleStartingTime = 0;
	_animationExitScaleProgress = 0;
	_animationExitScaleIsPlaying = false;
	
	_animationExitAlphaCurve = noone;	
	_animationExitAlphaReversed = false;
	_animationExitAlphaDuration = 0;
	_animationExitAlphaOffset = 0;
	_animationExitAlphaStart = 1;
	_animationExitAlphaEnd = 1;
	_animationExitAlphaStartingTime = 0;
	_animationExitAlphaProgress = 0;
	_animationExitAlphaIsPlaying = false;
	#endregion

	#endregion
	
	
	#region // Internal methods
	
	#region /// @method _preUpdateElement()
	/// @desc Runs pre update logic for Element  
	/// @returns {null}
	_preUpdateElement = function(){
				
	}#endregion
	
	#region /// @method _updateElement()
	/// @desc Runs update logic for Element
	/// @returns {null}
	_updateElement = function(){	
		if (animationEntranceIsPlaying()){			
			if (_animationEntranceMovementCurve != noone){
				_animationEntranceMovementProgress = clamp(max((current_time - _animationEntranceMovementStartingTime) - _animationEntranceMovementOffset, 0) / _animationEntranceMovementDuration, 0, 1);
				
				_animationEntranceMovementIsPlaying = _animationEntranceMovementProgress < 1;
				
				_x = _animationEntranceMovementStartX + 
					((_animationEntranceMovementEndX - _animationEntranceMovementStartX) * 
					animcurve_channel_evaluate(animcurve_get_channel(
						_animationEntranceMovementCurve, 0), 
						_animationEntranceMovementReversed ? 1 - _animationEntranceMovementProgress : _animationEntranceMovementProgress)
					);
					
				_y = _animationEntranceMovementStartY + 
					((_animationEntranceMovementEndY - _animationEntranceMovementStartY) * 
					animcurve_channel_evaluate(animcurve_get_channel(
						_animationEntranceMovementCurve, 0), 
						_animationEntranceMovementReversed ? 1 - _animationEntranceMovementProgress : _animationEntranceMovementProgress)
					);
			}else{
				_animationEntranceMovementIsPlaying = false;
			}
			
			if (_animationEntranceRotationCurve != noone){
				_animationEntranceRotationProgress = clamp(max((current_time - _animationEntranceRotationStartingTime) - _animationEntranceRotationOffset, 0) / _animationEntranceRotationDuration, 0, 1);
				
				_animationEntranceRotationIsPlaying = _animationEntranceRotationProgress < 1;
				
				_rotation = _animationEntranceRotationStart + 
					((_animationEntranceRotationEnd - _animationEntranceRotationStart) * 
					animcurve_channel_evaluate(animcurve_get_channel(
						_animationEntranceRotationCurve, 0), 
						_animationEntranceRotationReversed ? 1 - _animationEntranceRotationProgress : _animationEntranceRotationProgress)
					);
			}else{
				_animationEntranceRotationIsPlaying = false;
			}
			
			if (_animationEntranceScaleCurve != noone){
				_animationEntranceScaleProgress = clamp(max((current_time - _animationEntranceScaleStartingTime) - _animationEntranceScaleOffset, 0) / _animationEntranceScaleDuration, 0, 1);
				
				_animationEntranceScaleIsPlaying = _animationEntranceScaleProgress < 1;				
				
				_scale = _animationEntranceScaleStart + 
					((_animationEntranceScaleEnd - _animationEntranceScaleStart) * 
					animcurve_channel_evaluate(animcurve_get_channel(
						_animationEntranceScaleCurve, 0),
						_animationEntranceScaleReversed ? 1 - _animationEntranceScaleProgress : _animationEntranceScaleProgress)
					);
			}else{
				_animationEntranceScaleIsPlaying = false;
			}

		
			if (_animationEntranceAlphaCurve != noone){
				_animationEntranceAlphaProgress = clamp(max((current_time - _animationEntranceAlphaStartingTime) - _animationEntranceAlphaOffset, 0) / _animationEntranceAlphaDuration, 0, 1);
			
				_animationEntranceAlphaIsPlaying = _animationEntranceAlphaProgress < 1;	

				_alpha = _animationEntranceAlphaStart + 
					((_animationEntranceAlphaEnd - _animationEntranceAlphaStart) * 
					animcurve_channel_evaluate(animcurve_get_channel(
						_animationEntranceAlphaCurve, 0),
						_animationEntranceAlphaReversed ? 1 - _animationEntranceAlphaProgress : _animationEntranceAlphaProgress)
					);
			}else{
				_animationEntranceAlphaIsPlaying = false;
			}
			
			_x = round(_x);
			_y = round(_y);
			

		}
		
		if (animationExitIsPlaying()){
            if (_animationExitMovementCurve != noone){
				_animationExitMovementProgress = clamp(max((current_time - _animationExitMovementStartingTime) - _animationExitMovementOffset, 0) / _animationExitMovementDuration, 0, 1);
				
				_animationExitMovementIsPlaying = _animationExitMovementProgress < 1;
				
				_x = _animationExitMovementStartX + 
					((_animationExitMovementEndX - _animationExitMovementStartX) * 
					animcurve_channel_evaluate(animcurve_get_channel(
						_animationExitMovementCurve, 0), 
						_animationExitMovementReversed ? 1 - _animationExitMovementProgress : _animationExitMovementProgress)
					);
					
				_y = _animationExitMovementStartY + 
					((_animationExitMovementEndY - _animationExitMovementStartY) * 
					animcurve_channel_evaluate(animcurve_get_channel(
						_animationExitMovementCurve, 0), 
						_animationExitMovementReversed ? 1 - _animationExitMovementProgress : _animationExitMovementProgress)
					);
			}else{
				_animationExitMovementIsPlaying = false;
			}
			
			if (_animationExitRotationCurve != noone){
				_animationExitRotationProgress = clamp(max((current_time - _animationExitRotationStartingTime) - _animationExitRotationOffset, 0) / _animationExitRotationDuration, 0, 1);
				
				_animationExitRotationIsPlaying = _animationExitRotationProgress < 1;
				
				_rotation = _animationExitRotationStart + 
					((_animationExitRotationEnd - _animationExitRotationStart) * 
					animcurve_channel_evaluate(animcurve_get_channel(
						_animationExitRotationCurve, 0), 
						_animationExitRotationReversed ? 1 - _animationExitRotationProgress : _animationExitRotationProgress)
					);
			}else{
				_animationExitRotationIsPlaying = false;
			}
			
			if (_animationExitScaleCurve != noone){
				_animationExitScaleProgress = clamp(max((current_time - _animationExitScaleStartingTime) - _animationExitScaleOffset, 0) / _animationExitScaleDuration, 0, 1);
				
				_animationExitScaleIsPlaying = _animationExitScaleProgress < 1;				
				
				_scale = _animationExitScaleStart + 
					((_animationExitScaleEnd - _animationExitScaleStart) * 
					animcurve_channel_evaluate(animcurve_get_channel(
						_animationExitScaleCurve, 0),
						_animationExitScaleReversed ? 1 - _animationExitScaleProgress : _animationExitScaleProgress)
					);
			}else{
				_animationExitScaleIsPlaying = false;
			}

		
			if (_animationExitAlphaCurve != noone){
				_animationExitAlphaProgress = clamp(max((current_time - _animationExitAlphaStartingTime) - _animationExitAlphaOffset, 0) / _animationExitAlphaDuration, 0, 1);
			
				_animationExitAlphaIsPlaying = _animationExitAlphaProgress < 1;	

				_alpha = _animationExitAlphaStart + 
					((_animationExitAlphaEnd - _animationExitAlphaStart) * 
					animcurve_channel_evaluate(animcurve_get_channel(
						_animationExitAlphaCurve, 0),
						_animationExitAlphaReversed ? 1 - _animationExitAlphaProgress : _animationExitAlphaProgress)
					);
			}else{
				_animationExitAlphaIsPlaying = false;
			}
			
			_x = round(_x);
			_y = round(_y);
		}
	}#endregion
	
	#region /// @method _postUpdateElement()
	/// @desc Runs post update logic for Element
	/// @returns {null}
	_postUpdateElement = function(){
		
		_getElementSize();
		
		var _oldWidth = _totalWidth;
		var _oldHeight = _totalHeight;
		
		for (var i = 0; i < array_length(_subElements); i++){
			var subElement = _subElements[i];
			
			_leftX = min(_leftX, subElement._leftX);
			_rightX = max(_rightX, subElement._rightX);
			_topY = min(_topY, subElement._topY);
			_bottomY = max(_bottomY, subElement._bottomY);
		}
			
		_totalWidth = min(max(_rightX - _leftX + 4, 1), 8192);
		_totalHeight = min(max(_bottomY - _topY + 4, 1), 8192);
			
		if (((_oldWidth != _totalWidth) || (_oldHeight != _totalHeight)) || !surface_exists(_elementSurface)){
			if (surface_exists(_elementSurface)){
				
				surface_resize(_elementSurface, _totalWidth, _totalHeight);
			}else{
				_elementSurface = surface_create(_totalWidth, _totalHeight);
			}
		}
		
		_getElementVisibleDimensions();
		
	}#endregion

	#region /// @method _getElementSize()
	/// @desc Drawing logic for this element to be called in _draw()
	/// @returns {null}
	_getElementSize = function(){
		var pX = _x; // Parent X (_x if no parent)
		var pY = _y; // Parent Y
		
		if (_parentElement != noone){
			pX += _parentElement._x;
			pY += _parentElement._y;
		}
		
		_elementLeftX = -sprite_get_xoffset(spr_testTexture);
		_elementTopY = -sprite_get_yoffset(spr_testTexture);
		
		
		_leftX = pX - sprite_get_xoffset(spr_testTexture);
		_rightX = _leftX + sprite_get_width(spr_testTexture);
		_topY = pY - sprite_get_yoffset(spr_testTexture);
		_bottomY = _topY + sprite_get_height(spr_testTexture);
		_totalWidth = 0;
		_totalHeight = 0;
	}#endregion

	#region /// @method _getElementVisibleDimensions()
	/// @desc Gets visible dimensions of this element.
	/// @returns {null}
	_getElementVisibleDimensions = function(){
		_elementLeftDrawOffset = 0;
		_elementTopDrawOffset = 0; 
		_elementDrawWidth = _totalWidth;
		_elementDrawHeight = _totalHeight;	
	}#endregion
	
	/// @method _drawElement()
	/// @desc Draw this element to be called in _draw()
	/// @returns {null}
	_drawElement = function(){
		var pX = _x; // Parent X (_x if no parent)
		var pY = _y; // Parent Y
		
		if (_parentElement != noone){
			pX += _parentElement._x;
			pY += _parentElement._y;
		}
		
		draw_sprite(spr_testTexture, 0, pX - _leftX + 2, pY - _topY + 2);
	}
	#endregion
	
	#region // Data manipulation methods
	
	/// @method copy(element)
	/// @desc Copies the attributes of the provided element. If element is of same type, then all attriubutes are copied, if element is of different type, only base element attriubutes are copied.
	/// @param {struct} element The element to copy attriubutes from 
	/// @returns {struct} This container for method chaining.
	copy = function(_element){
		if (instanceof(_element) == "visageContainer"){
			_x = _element._x;
			_y = _element._y;
			_width = _element._width;
			_height = _element._height;
			_rotation = _element._rotation;
			_scale = _element._scale;
			_alpha = _element._alpha;
			_isVisible = _element._isVisible;
				
			_animationEntranceMovementCurve = _element._animationEntranceMovementCurve;
			_animationEntranceMovementReversed = _element._animationEntranceMovementReversed;
			_animationEntranceMovementDuration = _element._animationEntranceMovementDuration;
			_animationEntranceMovementOffset = _element._animationEntranceMovementOffset;
			_animationEntranceMovementStartX = _element._animationEntranceMovementStartX;
			_animationEntranceMovementStartY = _element._animationEntranceMovementStartY
			_animationEntranceMovementEndX = _element._animationEntranceMovementEndX;
			_animationEntranceMovementEndY = _element._animationEntranceMovementEndY;
	
			_animationEntranceRotationCurve = _element._animationEntranceRotationCurve;
			_animationEntranceRotationReversed = _element._animationEntranceRotationReversed;
			_animationEntranceRotationDuration = _element._animationEntranceRotationDuration;
			_animationEntranceRotationOffset = _element._animationEntranceRotationOffset;
			_animationEntranceRotationStart = _element._animationEntranceRotationStart;
			_animationEntranceRotationEnd = _element._animationEntranceRotationEnd;
	
			_animationEntranceScaleCurve = _element._animationEntranceScaleCurve;
			_animationEntranceScaleReversed = _element._animationEntranceScaleReversed;
			_animationEntranceScaleDuration = _element._animationEntranceScaleDuration;
			_animationEntranceScaleOffset = _element._animationEntranceScaleOffset;
			_animationEntranceScaleStart = _element._animationEntranceScaleStart;
			_animationEntranceScaleEnd = _element._animationEntranceScaleEnd;
	
			_animationEntranceAlphaCurve = _element._animationEntranceAlphaCurve;
			_animationEntranceAlphaReversed = _element._animationEntranceAlphaReversed;
			_animationEntranceAlphaDuration = _element._animationEntranceAlphaDuration;
			_animationEntranceAlphaOffset = _element._animationEntranceAlphaOffset;
			_animationEntranceAlphaStart = _element._animationEntranceAlphaStart;
			_animationEntranceAlphaEnd = _element._animationEntranceAlphaEnd;
				
			_animationExitMovementCurve = _element._animationExitMovementCurve;
			_animationExitMovementReversed = _element._animationExitMovementReversed;
			_animationExitMovementDuration = _element._animationExitMovementDuration;
			_animationExitMovementOffset = _element._animationExitMovementOffset;
			_animationExitMovementStartX = _element._animationExitMovementStartX;
			_animationExitMovementStartY = _element._animationExitMovementStartY
			_animationExitMovementEndX = _element._animationExitMovementEndX;
			_animationExitMovementEndY = _element._animationExitMovementEndY;
	
			_animationExitRotationCurve = _element._animationExitRotationCurve;
			_animationExitRotationReversed = _element._animationExitRotationReversed;
			_animationExitRotationDuration = _element._animationExitRotationDuration;
			_animationExitRotationOffset = _element._animationExitRotationOffset;
			_animationExitRotationStart = _element._animationExitRotationStart;
			_animationExitRotationEnd = _element._animationExitRotationEnd;
	
			_animationExitScaleCurve = _element._animationExitScaleCurve;
			_animationExitScaleReversed = _element._animationExitScaleReversed;
			_animationExitScaleDuration = _element._animationExitScaleDuration;
			_animationExitScaleOffset = _element._animationExitScaleOffset;
			_animationExitScaleStart = _element._animationExitScaleStart;
			_animationExitScaleEnd = _element._animationExitScaleEnd;
	
			_animationExitAlphaCurve = _element._animationExitAlphaCurve;
			_animationExitAlphaReversed = _element._animationExitAlphaReversed;
			_animationExitAlphaDuration = _element._animationExitAlphaDuration;
			_animationExitAlphaOffset = _element._animationExitAlphaOffset;
			_animationExitAlphaStart = _element._animationExitAlphaStart;
			_animationExitAlphaEnd = _element._animationExitAlphaEnd;
				
			_visageLog("The provided struct is of type visageContainer. All attributes will be copied.", true);
		}else{
			_visageLog("The provided struct is not of type visageContainer and therefore no data has been copied.");
		}
		
		return _self;
	}
	
	/// @method setVisibility(visible)
	/// @desc Sets the visibility of the container
	/// @param {bool} visible If the container is visible or not.
	/// @returns {struct} This element for method chaining.
	setVisibility = function(_visible){
		_isVisible = _visible;
	}

	/// @method getVisibility(visible)
	/// @desc Gets the visibility of the container
	/// @returns {bool}
	getVisibility = function(){
		return _isVisible;
	}
	
	#endregion
	
	#region // Animation methods

	/// @method animationEntrancePlay(forced)
	/// @desc starts playing the exit animation.
	/// @param {bool} forced Determines if the animation is forced to play or not.
	/// @returns {bool} True if the animation was started, False if not.
	animationEntrancePlay = function(_forced = false){
		
		if (_forced){
			animationEntranceReset();
			animationExitReset();
		}
		
		
		if (!animationEntranceIsPlaying() && !animationExitIsPlaying()){
			_animationEntranceMovementStartingTime = current_time + _animationEntranceOffset;
			_animationEntranceRotationStartingTime = current_time + _animationEntranceOffset;
			_animationEntranceScaleStartingTime = current_time + _animationEntranceOffset;
			_animationEntranceAlphaStartingTime = current_time + _animationEntranceOffset;
		
			_animationEntranceMovementIsPlaying = true;
			_animationEntranceRotationIsPlaying = true;
			_animationEntranceScaleIsPlaying = true;
			_animationEntranceAlphaIsPlaying = true;
			
			return true;
		}
		return false;
	}
		
	/// @method animationEntranceIsPlaying()
	/// @desc Checks if entrance animation is currently playing.
	/// @returns {bool} True if the animation is currently playing, False if not.
	animationEntranceIsPlaying = function(){
		return (_animationEntranceMovementIsPlaying ||
				_animationEntranceRotationIsPlaying ||
				_animationEntranceScaleIsPlaying ||
				_animationEntranceAlphaIsPlaying);
	}
	
	/// @method animationEntranceReset()
	/// @desc Resets exit animation to beginning and stops playing.
	/// @returns {null}
	animationEntranceReset = function(){
		_animationEntranceMovementProgress = 0;
		_animationEntranceRotationProgress = 0;
		_animationEntranceScaleProgress = 0;
		_animationEntranceAlphaProgress = 0;
		
		_animationEntranceMovementStartingTime = 0;
		_animationEntranceRotationStartingTime = 0;
		_animationEntranceScaleStartingTime = 0;
		_animationEntranceAlphaStartingTime = 0;
		
		_animationEntranceMovementIsPlaying = false;
		_animationEntranceRotationIsPlaying = false;
		_animationEntranceScaleIsPlaying = false;
		_animationEntranceAlphaIsPlaying = false;
	}
	
	/// @method animationExitPlay(forced)
	/// @desc starts playing the exit animation.
	/// @param {bool} forced Determines if the animation is forced to play or not.
	/// @returns {bool} True if the animation was started, False if not.
	animationExitPlay = function(_forced = false){
		
		if (_forced){
			animationEntranceReset();
			animationExitReset();
		}
		
		if (!animationEntranceIsPlaying() && !animationExitIsPlaying()){
			_animationExitMovementStartingTime = current_time + _animationExitOffset;
			_animationExitRotationStartingTime = current_time + _animationExitOffset;
			_animationExitScaleStartingTime = current_time + _animationExitOffset;
			_animationExitAlphaStartingTime = current_time + _animationExitOffset;
		
			_animationExitMovementIsPlaying = true;
			_animationExitRotationIsPlaying = true;
			_animationEntranceScaleIsPlaying = true;
			_animationEntranceAlphaIsPlaying = true;
			return true;
		}
		return false;
	}
	
	/// @method animationExitIsPlaying()
	/// @desc Checks if exit animation is currently playing.
	/// @returns {bool} True if the animation is currently playing, False if not.
	animationExitIsPlaying = function(){
		return (_animationExitMovementIsPlaying ||
				_animationExitRotationIsPlaying ||
				_animationExitScaleIsPlaying ||
				_animationExitAlphaIsPlaying);
	}
	
	/// @method animationExitReset()
	/// @desc Resets exit animation to beginning and stops playing.
	/// @returns {null}
	animationExitReset = function(){
		_animationExitMovementProgress = 0;
		_animationExitRotationProgress = 0;
		_animationExitScaleProgress = 0;
		_animationExitAlphaProgress = 0;
		
		_animationExitMovementStartingTime = 0;
		_animationExitRotationStartingTime = 0;
		_animationExitScaleStartingTime = 0;
		_animationExitAlphaStartingTime = 0;
		
		_animationExitMovementIsPlaying = false;
		_animationExitRotationIsPlaying = false;
		_animationExitScaleIsPlaying = false;
		_animationExitAlphaIsPlaying = false;
	}
	
	/// @method setEntranceAnimationOffset(offset)
	/// @desc Sets exit animation offset. This adds an offset to all entrance animation channels, for use when container is a child to another container.
	/// @param {real} offset The offset (in ms) to delay the entire entrance animation.
	/// @returns {struct} This container for method chaining.
	setEntranceAnimationOffset = function(_offset){
		_animationEntranceOffset = _offset;
		return _self;
	}
	
	/// @method setExitAnimationOffset(offset)
	/// @desc Sets exit animation offset. This adds an offset to all exit animation channels, for use when container is a child to another container.
	/// @param {real} offset The offset (in ms) to delay the entire exit animation.
	/// @returns {struct} This container for method chaining.
	setExitAnimationOffset = function(_offset){
		_animationExitOffset = _offset;
		return _self;
	}

	#region // Movement
	/// @method setEntranceAnimationMovementCurve(animationCurve, isReversed)
	/// @desc Sets the movement animation curve for the entrance animation.
	/// @param {Asset.GMAnimCurve} animationCurve The animation curve to set in the container.
	/// @param {bool} isReversed Determines if the animation curve is read normally (false) or reversed (true)
	/// @returns {struct} This container for method chaining.
	setEntranceAnimationMovementCurve = function(_animationCurve, _isReversed){
		_animationEntranceMovementCurve = _animationCurve;
		_animationEntranceMovementReversed = _isReversed;
		return _self;
	}
	
	/// @method setEntranceAnimationMovementTiming(duration, offset)
	/// @desc Sets the movement animation duration and offset for the entrance animation.
	/// @param {real} duration The animation duration (in ms) to set in the container.
	/// @param {real} offset The starting offset (in ms) of the animation.
	/// @returns {struct} This container for method chaining.
	setEntranceAnimationMovementTiming = function(_duration, _offset){
		_animationEntranceMovementDuration = _duration;
		_animationEntranceMovementOffset = _offset;
		return _self;
	}
	
	/// @method setEntranceAnimationMovementPositionStart(startX, startY)
	/// @desc Sets the starting movement position for the entrance animation.
	/// @param {real} startX The animation starting x position to set in the container.
	/// @param {real} startY The animation starting y position to set in the container.
	/// @returns {struct} This container for method chaining.
	setEntranceAnimationMovementPositionStart = function(_startX, _startY){
		_animationEntranceMovementStartX = _startX;
		_animationEntranceMovementStartY = _startY;
		return _self;
	}
	
	/// @method setEntranceAnimationMovementPositionEnd(endX, endY)
	/// @desc Sets the ending movement position for the entrance animation.
	/// @param {real} endX The animation ending x position to set in the container.
	/// @param {real} endY The animation ending y position to set in the container.
	/// @returns {struct} This container for method chaining.
	setEntranceAnimationMovementPositionEnd = function(_endX, _endY){
		_animationEntranceMovementEndX = _endX;
		_animationEntranceMovementEndY = _endY;
		return _self;
	}
	
	/// @method setExitAnimationMovementCurve(animationCurve, isReversed)
	/// @desc Sets the movement animation curve for the exit animation.
	/// @param {Asset.GMAnimCurve} animationCurve The animation curve to set in the container.
	/// @param {bool} isReversed Determines if the animation curve is read normally (false) or reversed (true)
	/// @returns {struct} This container for method chaining.
	setExitAnimationMovementCurve = function(_animationCurve, _isReversed){
		_animationExitMovementCurve = _animationCurve;
		_animationExitMovementReversed = _isReversed;
		return _self;
	}
	
	/// @method setExitAnimationMovementTiming(duration, offset)
	/// @desc Sets the movement animation duration and offset for the exit animation.
	/// @param {real} duration The animation duration (in ms) to set in the container.
	/// @param {real} offset The starting offset (in ms) of the animation.
	/// @returns {struct} This container for method chaining.
	setExitAnimationMovementTiming = function(_duration, _offset){
		_animationExitMovementDuration = _duration;
		_animationExitMovementOffset = _offset;
		return _self;
	}
	
	/// @method setExitAnimationMovementPositionStart(startX, startY)
	/// @desc Sets the starting movement position for the exit animation.
	/// @param {real} startX The animation starting x position to set in the container.
	/// @param {real} startY The animation starting y position to set in the container.
	/// @returns {struct} This container for method chaining.
	setExitAnimationMovementPositionStart = function(_startX, _startY){
		_animationExitMovementStartX = _startX;
		_animationExitMovementStartY = _startY;
		return _self;
	}

	/// @method setExitAnimationMovementPositionEnd(endX, endY)
	/// @desc Sets the ending movement position for the exit animation.
	/// @param {real} endX The animation ending x position to set in the container.
	/// @param {real} endY The animation ending y position to set in the container.
	/// @returns {struct} This container for method chaining.
	setExitAnimationMovementPositionEnd = function(_endX, _endY){
		_animationExitMovementEndX = _endX;
		_animationExitMovementEndY = _endY;
		return _self;
	}
	#endregion
	
	#region // Rotation
	/// @method setEntranceAnimationRotationCurve(animationCurve, isReversed)
	/// @desc Sets the rotation animation curve for the entrance animation.
	/// @param {Asset.GMAnimCurve} animationCurve The animation curve to set in the container.
	/// @param {bool} isReversed Determines if the animation curve is read normally (false) or reversed (true)
	/// @returns {struct} This container for method chaining.
	setEntranceAnimationRotationCurve = function(_animationCurve, _isReversed){
		_animationEntranceRotationCurve = _animationCurve;
		_animationEntranceRotationReversed = _isReversed;
		return _self;
	}
	
	/// @method setEntranceAnimationRotationTiming(duration, offset)
	/// @desc Sets the rotation animation duration and offset for the entrance animation.
	/// @param {real} duration The animation duration (in ms) to set in the container.
	/// @param {real} offset The starting offset (in ms) of the animation.
	/// @returns {struct} This container for method chaining.
	setEntranceAnimationRotationTiming = function(_duration, _offset){
		_animationEntranceRotationDuration = _duration;
		_animationEntranceRotationOffset = _offset;
		return _self;
	}
	
	/// @method setEntranceAnimationRotationStart(startAngle)
	/// @desc Sets the starting rotation angle for the entrance animation.
	/// @param {real} startAngle The animation starting rotation angle to set in the container.
	/// @returns {struct} This container for method chaining.
	setEntranceAnimationRotationStart = function(_startAngle){
		_animationEntranceRotationStart = _startAngle;
		return _self;
	}
	
	/// @method setEntranceAnimationRotationEnd(endAngle)
	/// @desc Sets the ending rotation angle for the entrance animation.
	/// @param {real} endAngle The animation ending rotation angle to set in the container.
	/// @returns {struct} This container for method chaining.
	setEntranceAnimationRotationEnd = function(_endAngle){
		_animationEntranceRotationEnd = _endAngle;
		return _self;
	}
	
	/// @method setExitAnimationRotationCurve(animationCurve, isReversed)
	/// @desc Sets the rotation animation curve for the exit animation.
	/// @param {Asset.GMAnimCurve} animationCurve The animation curve to set in the container.
	/// @param {bool} isReversed Determines if the animation curve is read normally (false) or reversed (true)
	/// @returns {struct} This container for method chaining.
	setExitAnimationRotationCurve = function(_animationCurve, _isReversed){
		_animationExitRotationCurve = _animationCurve;
		_animationExitRotationReversed = _isReversed;
		return _self;
	}

	/// @method setExitAnimationRotationTiming(duration, offset)
	/// @desc Sets the rotation animation duration and offset for the exit animation.
	/// @param {real} duration The animation duration (in ms) to set in the container.
	/// @param {real} offset The starting offset (in ms) of the animation.
	/// @returns {struct} This container for method chaining.
	setExitAnimationRotationTiming = function(_duration, _offset){
		_animationExitRotationDuration = _duration;
		_animationExitRotationOffset = _offset;
		return _self;
	}
	
	/// @method setExitAnimationRotationStart(startAngle)
	/// @desc Sets the starting rotation angle for the exit animation.
	/// @param {real} startAngle The animation starting rotation angle to set in the container.
	/// @returns {struct} This container for method chaining.
	setExitAnimationRotationStart = function(_startAngle){
		_animationExitRotationStart = _startAngle;
		return _self;
	}
	
	/// @method setExitAnimationRotationEnd(endAngle)
	/// @desc Sets the ending rotation angle for the exit animation.
	/// @param {real} endAngle The animation ending rotation angle to set in the container.
	/// @returns {struct} This container for method chaining.
	setExitAnimationRotationEnd = function(_endAngle){
		_animationExitRotationEnd = _endAngle;
		return _self;
	}
	#endregion
	
	#region // Scale
	
	/// @method setEntranceAnimationScaleCurve(animationCurve, isReversed)
	/// @desc Sets the scale animation curve for the entrance animation.
	/// @param {Asset.GMAnimCurve} animationCurve The animation curve to set in the container.
	/// @param {bool} isReversed Determines if the animation curve is read normally (false) or reversed (true)
	/// @returns {struct} This container for method chaining.
	setEntranceAnimationScaleCurve = function(_animationCurve, _isReversed){
		_animationEntranceScaleCurve = _animationCurve;
		_animationEntranceScaleReversed = _isReversed;
		return _self;
	}
	
	/// @method setEntranceAnimationScaleTiming(duration, offset)
	/// @desc Sets the scale animation duration and offset for the entrance animation.
	/// @param {real} duration The animation duration (in ms) to set in the container.
	/// @param {real} offset The starting offset (in ms) of the animation.
	/// @returns {struct} This container for method chaining.
	setEntranceAnimationScaleTiming = function(_duration, _offset){
		_animationEntranceScaleDuration = _duration;
		_animationEntranceScaleOffset = _offset;
		return _self;
	}
	
	/// @method setEntranceAnimationScaleStart(startScale)
	/// @desc Sets the starting scale for the entrance animation.
	/// @param {real} startScale The animation starting scale to set in the container.
	/// @returns {struct} This container for method chaining.
	setEntranceAnimationScaleStart = function(_startScale){
		_animationEntranceScaleStart = _startScale;
		return _self;
	}
	
	/// @method setEntranceAnimationScaleEnd(endScale)
	/// @desc Sets the ending scale for the entrance animation.
	/// @param {real} endScale The animation ending scale to set in the container.
	/// @returns {struct} This container for method chaining.
	setEntranceAnimationScaleEnd = function(_endScale){
		_animationEntranceScaleEnd = _endScale;
		return _self;
	}
	
	/// @method setExitAnimationScaleCurve(animationCurve, isReversed)
	/// @desc Sets the scale animation curve for the exit animation.
	/// @param {Asset.GMAnimCurve} animationCurve The animation curve to set in the container.
	/// @param {bool} isReversed Determines if the animation curve is read normally (false) or reversed (true)
	/// @returns {struct} This container for method chaining.
	setExitAnimationScaleCurve = function(_animationCurve, _isReversed){
		_animationExitScaleCurve = _animationCurve;
		_animationExitScaleReversed = _isReversed;
		return _self;
	}

	/// @method setExitAnimationScaleTiming(duration, offset)
	/// @desc Sets the scale animation duration and offset for the exit animation.
	/// @param {real} duration The animation duration (in ms) to set in the container.
	/// @param {real} offset The starting offset (in ms) of the animation.
	/// @returns {struct} This container for method chaining.
	setExitAnimationScaleTiming = function(_duration, _offset){
		_animationExitScaleDuration = _duration;
		_animationExitScaleOffset = _offset;
		return _self;
	}
	
	/// @method setExitAnimationScaleStart(startScale)
	/// @desc Sets the starting scale for the exit animation.
	/// @param {real} startScale The animation starting scale to set in the container.
	/// @returns {struct} This container for method chaining.
	setExitAnimationScaleStart = function(_startScale){
		_animationExitScaleStart = _startScale;
		return _self;
	}
	
	/// @method setExitAnimationScaleEnd(endScale)
	/// @desc Sets the ending scale for the exit animation.
	/// @param {real} endScale The animation ending scale to set in the container.
	/// @returns {struct} This container for method chaining.
	setExitAnimationScaleEnd = function(_endScale){
		_animationExitScaleEnd = _endScale;
		return _self;
	}
	#endregion
	
	#region // Alpha
	/// @method setEntranceAnimationAlphaCurve(animationCurve, isReversed)
	/// @desc Sets the alpha animation curve for the entrance animation.
	/// @param {Asset.GMAnimCurve} animationCurve The animation curve to set in the container.
	/// @param {bool} isReversed Determines if the animation curve is read normally (false) or reversed (true)
	/// @returns {struct} This container for method chaining.
	setEntranceAnimationAlphaCurve = function(_animationCurve, _isReversed){
		_animationEntranceAlphaCurve = _animationCurve;
		_animationEntranceAlphaReversed = _isReversed;
		return _self;
	}
	
	/// @method setEntranceAnimationAlphaTiming(duration, offset)
	/// @desc Sets the alpha animation duration and offset for the entrance animation.
	/// @param {real} duration The animation duration (in ms) to set in the container.
	/// @param {real} offset The starting offset (in ms) of the animation.
	/// @returns {struct} This container for method chaining.
	setEntranceAnimationAlphaTiming = function(_duration, _offset){
		_animationEntranceAlphaDuration = _duration;
		_animationEntranceAlphaOffset = _offset;
		return _self;
	}
	
	/// @method setEntranceAnimationAlphaStart(startAlpha)
	/// @desc Sets the starting alpha for the entrance animation.
	/// @param {real} startAlpha The animation starting alpha to set in the container.
	/// @returns {struct} This container for method chaining.
	setEntranceAnimationAlphaStart = function(_startAlpha){
		_animationEntranceAlphaStart = _startAlpha;
		return _self;
	}
	
	/// @method setEntranceAnimationAlphaEnd(endAlpha)
	/// @desc Sets the starting alpha for the entrance animation.
	/// @param {real} endAlpha The animation ending alpha to set in the container.
	/// @returns {struct} This container for method chaining.
	setEntranceAnimationAlphaEnd = function(_endAlpha){
		_animationEntranceAlphaEnd = _endAlpha;
		return _self;
	}
	
	/// @method setExitAnimationAlphaCurve(animationCurve, isReversed)
	/// @desc Sets the alpha animation curve for the exit animation.
	/// @param {Asset.GMAnimCurve} animationCurve The animation curve to set in the container.
	/// @param {bool} isReversed Determines if the animation curve is read normally (false) or reversed (true)
	/// @returns {struct} This container for method chaining.
	setExitAnimationAlphaCurve = function(_animationCurve, _isReversed){
		_animationExitAlphaCurve = _animationCurve;
		_animationExitAlphaReversed = _isReversed;
		return _self;
	}

	/// @method setExitAnimationAlphaTiming(duration, offset)
	/// @desc Sets the alpha animation duration and offset for the exit animation.
	/// @param {real} duration The animation duration (in ms) to set in the container.
	/// @param {real} offset The starting offset (in ms) of the animation.
	/// @returns {struct} This container for method chaining.
	setExitAnimationAlphaTiming = function(_duration, _offset){
		_animationExitAlphaDuration = _duration;
		_animationExitAlphaOffset = _offset;
		return _self;
	}
	
	/// @method setExitAnimationAlphaStart(startAlpha)
	/// @desc Sets the starting alpha for the exit animation.
	/// @param {real} startAlpha The animation starting alpha to set in the container.
	/// @returns {struct} This container for method chaining.
	setExitAnimationAlphaStart = function(_startAlpha){
		_animationExitAlphaStart = _startAlpha;
		return _self;
	}
	
	/// @method setExitAnimationAlphaEnd(endAlpha)
	/// @desc Sets the starting alpha for the exit animation.
	/// @param {real} endAlpha The animation ending alpha to set in the container.
	/// @returns {struct} This container for method chaining.
	setExitAnimationAlphaEnd = function(_endAlpha){
		_animationExitAlphaEnd = _endAlpha;
		return _self;
	}
	#endregion
	
	#endregion
	

}
