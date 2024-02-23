
function visage_track_element(element){
	__visageController.track_element(element);
}

function visage_remove_tracked_element(element){
	__visageController.remove_tracked_element(element);
}


function visageContainer() constructor{
	// Attribute variables
	_x = 0;
	_y = 0;
	_rotation = 0;
	_scale = 1;
	_alpha = 1;
	_isVisible = true;
	_parentElement = noone;
	_subElements = [];
	
	#region //Animation variables
	
	#region //Entrance animation
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
	_animationEntranceScaleOffset = 0;
	_animationEntranceAlphaStart = 1;
	_animationEntranceAlphaEnd = 1;
	_animationEntranceAlphaStartingTime = 0;
	_animationEntranceAlphaProgress = 0;
	_animationEntranceAlphaIsPlaying = false;
	#endregion
	
	#region //Exit animation
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
	
	#region // Animation methods
	
	animationEntrancePlay = function(){
		show_debug_message(string("Movement Playing: {0}\nRotation Playing: {1}\nScale Playing: {2}\nAlpha Playing: {3}\n", _animationEntranceMovementIsPlaying, _animationEntranceRotationIsPlaying, _animationEntranceScaleIsPlaying, _animationEntranceAlphaIsPlaying))
		if (!animationEntranceIsPlaying() && !animationExitIsPlaying()){
			_animationEntranceMovementStartingTime = current_time;
			_animationEntranceRotationStartingTime = current_time;
			_animationEntranceScaleStartingTime = current_time;
			_animationEntranceAlphaStartingTime = current_time;
		
			_animationEntranceMovementIsPlaying = true;
			_animationEntranceRotationIsPlaying = true;
			_animationEntranceScaleIsPlaying = true;
			_animationEntranceAlphaIsPlaying = true;
		}
	}
	
	animationEntranceIsPlaying = function(){
		return (_animationEntranceMovementIsPlaying ||
				_animationEntranceRotationIsPlaying ||
				_animationEntranceScaleIsPlaying ||
				_animationEntranceAlphaIsPlaying);
	}
	
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
	
	animationExitPlay = function(){
		if (!animationEntranceIsPlaying() && !animationExitIsPlaying()){
			_animationExitMovementStartingTime = current_time;
			_animationExitRotationStartingTime = current_time;
			_animationExitScaleStartingTime = current_time;
			_animationExitAlphaStartingTime = current_time;
		
			_animationExitMovementIsPlaying = true;
			_animationExitRotationIsPlaying = true;
			_animationEntranceScaleIsPlaying = true;
			_animationEntranceAlphaIsPlaying = true;
		}
	}
	
	animationExitIsPlaying = function(){
		return (_animationExitMovementIsPlaying ||
				_animationExitRotationIsPlaying ||
				_animationExitScaleIsPlaying ||
				_animationExitAlphaIsPlaying);
	}
	
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

	_update = function(){
		if (animationEntranceIsPlaying()){
			_animationEntranceMovementProgress = clamp(max((current_time - _animationEntranceMovementStartingTime) - _animationEntranceMovementOffset, 0) / _animationEntranceMovementDuration, 0, 1);
			_animationEntranceRotationProgress = clamp(max((current_time - _animationEntranceRotationStartingTime) - _animationEntranceRotationOffset, 0) / _animationEntranceRotationDuration, 0, 1);
			_animationEntranceScaleProgress = clamp(max((current_time - _animationEntranceScaleStartingTime) - _animationEntranceScaleOffset, 0) / _animationEntranceScaleDuration, 0, 1);
			_animationEntranceAlphaProgress = clamp(max((current_time - _animationEntranceAlphaStartingTime) - _animationEntranceAlphaOffset, 0) / _animationEntranceAlphaDuration, 0, 1);

			show_debug_message(string("Movement Progress: {0}\nRotation Progress: {1}\nScale Progress: {2}\nAlpha Progress: {3}\n", _animationEntranceMovementProgress, _animationEntranceRotationProgress, _animationEntranceScaleProgress, _animationEntranceAlphaProgress, ))
			
			_animationEntranceMovementIsPlaying = _animationEntranceMovementProgress < 1;
			_animationEntranceRotationIsPlaying = _animationEntranceRotationProgress < 1;
			_animationEntranceScaleIsPlaying = _animationEntranceScaleProgress < 1;
			_animationEntranceAlphaIsPlaying = _animationEntranceAlphaProgress < 1;


			if (_animationEntranceMovementCurve != noone){
				_x = _animationEntranceMovementStartX + ((_animationEntranceMovementEndX - _animationEntranceMovementStartX) * animcurve_channel_evaluate(animcurve_get_channel(_animationEntranceMovementCurve, 0), _animationEntranceMovementProgress));
				_y = _animationEntranceMovementStartY + ((_animationEntranceMovementEndY - _animationEntranceMovementStartY) * animcurve_channel_evaluate(animcurve_get_channel(_animationEntranceMovementCurve, 0), _animationEntranceMovementProgress));
			}
			
			if (_animationEntranceRotationCurve != noone){
				_rotation = _animationEntranceRotationStart + ((_animationEntranceRotationEnd - _animationEntranceRotationStart) * animcurve_channel_evaluate(animcurve_get_channel(_animationEntranceRotationCurve, 0), _animationEntranceRotationProgress));
			}
			
			if (_animationEntranceScaleCurve != noone){
				_scale = _animationEntranceScaleStart + ((_animationEntranceScaleEnd - _animationEntranceScaleStart) * animcurve_channel_evaluate(animcurve_get_channel(_animationEntranceScaleCurve, 0), _animationEntranceScaleProgress));
			}
			
			if (_animationEntranceAlphaCurve != noone){
				_alpha = _animationEntranceAlphaStart + ((_animationEntranceAlphaEnd - _animationEntranceAlphaStart) * animcurve_channel_evaluate(animcurve_get_channel(_animationEntranceAlphaCurve, 0), _animationEntranceAlphaProgress));
			}
		}
		
		if (animationExitIsPlaying()){
            _animationExitMovementProgress = clamp(max((current_time - _animationExitMovementStartingTime) - _animationExitMovementOffset, 0) / _animationExitMovementDuration, 0, 1);
            _animationExitRotationProgress = clamp(max((current_time - _animationExitRotationStartingTime) - _animationExitRotationOffset, 0) / _animationExitRotationDuration, 0, 1);
            _animationExitScaleProgress = clamp(max((current_time - _animationExitScaleStartingTime) - _animationExitScaleOffset, 0) / _animationExitScaleDuration, 0, 1);
            _animationExitAlphaProgress = clamp(max((current_time - _animationExitAlphaStartingTime) - _animationExitAlphaOffset, 0) / _animationExitAlphaDuration, 0, 1);

            show_debug_message(string("Movement Progress: {0}\nRotation Progress: {1}\nScale Progress: {2}\nAlpha Progress: {3}\n", _animationExitMovementProgress, _animationExitRotationProgress, _animationExitScaleProgress, _animationExitAlphaProgress, ))
            
            _animationExitMovementIsPlaying = _animationExitMovementProgress < 1;
            _animationExitRotationIsPlaying = _animationExitRotationProgress < 1;
            _animationExitScaleIsPlaying = _animationExitScaleProgress < 1;
            _animationExitAlphaIsPlaying = _animationExitAlphaProgress < 1;


            if (_animationExitMovementCurve != noone){
                _x = _animationExitMovementStartX + ((_animationExitMovementEndX - _animationExitMovementStartX) * animcurve_channel_evaluate(animcurve_get_channel(_animationExitMovementCurve, 0), _animationExitMovementProgress));
                _y = _animationExitMovementStartY + ((_animationExitMovementEndY - _animationExitMovementStartY) * animcurve_channel_evaluate(animcurve_get_channel(_animationExitMovementCurve, 0), _animationExitMovementProgress));
            }
            
            if (_animationExitRotationCurve != noone){
                _rotation = _animationExitRotationStart + ((_animationExitRotationEnd - _animationExitRotationStart) * animcurve_channel_evaluate(animcurve_get_channel(_animationExitRotationCurve, 0), _animationExitRotationProgress));
            }
            
            if (_animationExitScaleCurve != noone){
                _scale = _animationExitScaleStart + ((_animationExitScaleEnd - _animationExitScaleStart) * animcurve_channel_evaluate(animcurve_get_channel(_animationExitScaleCurve, 0), _animationExitScaleProgress));
            }
            
            if (_animationExitAlphaCurve != noone){
                _alpha = _animationExitAlphaStart + ((_animationExitAlphaEnd - _animationExitAlphaStart) * animcurve_channel_evaluate(animcurve_get_channel(_animationExitAlphaCurve, 0), _animationExitAlphaProgress));
            }
        }

		
	
	}

	_draw = function(){
		draw_sprite_ext(spr_testTexture, 0, _x, _y, _scale, _scale, _rotation, c_white, _alpha);
	}


	#region // Movement
	setEntranceAnimationMovementCurve = function(_animationCurve, _isReversed){
		_animationEntranceMovementCurve = _animationCurve;
		_animationEntranceMovementReversed = _isReversed;
	}
	
	setEntranceAnimationMovementDuration = function(_duration, _offset){
		_animationEntranceMovementDuration = _duration;
		_animationEntranceMovementOffset = _offset;
	}
	
	setEntranceAnimationMovementPositionStart = function(_startX, _startY){
		_animationEntranceMovementStartX = _startX;
		_animationEntranceMovementStartY = _startY;
	}
	
	setEntranceAnimationMovementPositionEnd = function(_endX, _endY){
		_animationEntranceMovementEndX = _endX;
		_animationEntranceMovementEndY = _endY;
	}
	
	setExitAnimationMovementCurve = function(_animationCurve, _isReversed){
		_animationExitMovementCurve = _animationCurve;
		_animationExitMovementReversed = _isReversed;
	}

	setExitAnimationMovementDuration = function(_duration, _offset){
		_animationExitMovementDuration = _duration;
		_animationExitMovementOffset = _offset;
	}
	
	setExitAnimationMovementPositionStart = function(_startX, _startY){
		_animationExitMovementStartX = _startX;
		_animationExitMovementStartY = _startY;
	}
	
	setExitAnimationMovementPositionEnd = function(_endX, _endY){
		_animationExitMovementEndX = _endX;
		_animationExitMovementEndY = _endY;
	}
	#endregion
	
	#region // Rotation
	setEntranceAnimationRotationCurve = function(_animationCurve, _isReversed){
		_animationEntranceRotationCurve = _animationCurve;
		_animationEntranceRotationReversed = _isReversed;
	}
	
	setEntranceAnimationRotationDuration = function(_duration, _offset){
		_animationEntranceRotationDuration = _duration;
		_animationEntranceRotationOffset = _offset;
	}
	
	setEntranceAnimationRotationStart = function(_startAngle){
		_animationEntranceRotationStart = _startAngle
	}
	
	setEntranceAnimationRotationEnd = function(_endAngle){
		_animationEntranceRotationEnd = _endAngle;
	}
	
	setExitAnimationRotationCurve = function(_animationCurve, _isReversed){
		_animationExitRotationCurve = _animationCurve;
		_animationExitRotationReversed = _isReversed;
	}

	setExitAnimationRotationDuration = function(_duration, _offset){
		_animationExitRotationDuration = _duration;
		_animationExitRotationOffset = _offset;
	}
	
	setExitAnimationRotationStart = function(_startAngle){
		_animationExitRotationStart = _startAngle;
	}
	
	setExitAnimationRotationEnd = function(_endAngle){
		_animationExitRotationEnd = _endAngle;
	}
	#endregion
	
	#region // Scale
	setEntranceAnimationScaleCurve = function(_animationCurve, _isReversed){
		_animationEntranceScaleCurve = _animationCurve;
		_animationEntranceScaleReversed = _isReversed;
	}
	
	setEntranceAnimationScaleDuration = function(_duration, _offset){
		_animationEntranceScaleDuration = _duration;
		_animationEntranceScaleOffset = _offset;
	}
	
	setEntranceAnimationScaleStart = function(_startScale){
		_animationEntranceScaleStart = _startScale
	}
	
	setEntranceAnimationScaleEnd = function(_endScale){
		_animationEntranceScaleEnd = _endScale;
	}
	
	setExitAnimationScaleCurve = function(_animationCurve, _isReversed){
		_animationExitScaleCurve = _animationCurve;
		_animationExitScaleReversed = _isReversed;
	}

	setExitAnimationScaleDuration = function(_duration, _offset){
		_animationExitScaleDuration = _duration;
		_animationExitScaleOffset = _offset;
	}
	
	setExitAnimationScaleStart = function(_startScale){
		_animationExitScaleStart = _startScale;
	}
	
	setExitAnimationScaleEnd = function(_endScale){
		_animationExitScaleEnd = _endScale;
	}
	#endregion
	
	#region // Alpha
	setEntranceAnimationAlphaCurve = function(_animationCurve, _isReversed){
		_animationEntranceAlphaCurve = _animationCurve;
		_animationEntranceAlphaReversed = _isReversed;
	}
	
	setEntranceAnimationAlphaDuration = function(_duration, _offset){
		_animationEntranceAlphaDuration = _duration;
		_animationEntranceAlphaOffset = _offset;
	}
	
	setEntranceAnimationAlphaStart = function(_startAlpha){
		_animationEntranceAlphaStart = _startAlpha
	}
	
	setEntranceAnimationAlphaEnd = function(_endAlpha){
		_animationEntranceAlphaEnd = _endAlpha;
	}
	
	setExitAnimationAlphaCurve = function(_animationCurve, _isReversed){
		_animationExitAlphaCurve = _animationCurve;
		_animationExitAlphaReversed = _isReversed;
	}

	setExitAnimationAlphaDuration = function(_duration, _offset){
		_animationExitAlphaDuration = _duration;
		_animationExitAlphaOffset = _offset;
	}
	
	setExitAnimationAlphaStart = function(_startAlpha){
		_animationExitAlphaStart = _startAlpha;
	}
	
	setExitAnimationAlphaEnd = function(_endAlpha){
		_animationExitAlphaEnd = _endAlpha;
	}
	#endregion
	
	#endregion
	
	#endregion
}
