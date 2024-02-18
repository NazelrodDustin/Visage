visageContainer = function() constructor{
	// Attribute variables
	_cx = 0;
	_cy = 0;
	_rotation = 0;
	_scale = 1;
	_alpha = 1;
	_isVisible = true;
	_parentElement = noone;
	_subElements = []
	
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
		_animationEntranceMovementStartingTime = current_time;
		_animationEntranceRotationStartingTime = current_time;
		_animationEntranceScaleStartingTime = current_time;
		_animationEntranceAlphaStartingTime = current_time;
		
		_animationEntranceMovementIsPlaying = true;
		_animationEntranceRotationIsPlaying = true;
		_animationEntranceScaleIsPlaying = true;
		_animationEntranceAlphaIsPlaying = true;
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
	
	setEntranceAnimationRotationPositionStart = function(_startAngle){
		_animationEntranceRotationStart = _startAngle
	}
	
	setEntranceAnimationRotationPositionEnd = function(_endAngle){
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
	
	setExitAnimationRotationPositionStart = function(_startAngle){
		_animationExitRotationStart = _startAngle;
	}
	
	setExitAnimationRotationPositionEnd = function(_endAngle){
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
	
	setEntranceAnimationScalePositionStart = function(_startScale){
		_animationEntranceScaleStart = _startScale
	}
	
	setEntranceAnimationScalePositionEnd = function(_endScale){
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
	
	setExitAnimationScalePositionStart = function(_startScale){
		_animationExitScaleStart = _startScale;
	}
	
	setExitAnimationScalePositionEnd = function(_endScale){
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
	
	setEntranceAnimationAlphaPositionStart = function(_startAlpha){
		_animationEntranceAlphaStart = _startAlpha
	}
	
	setEntranceAnimationAlphaPositionEnd = function(_endAlpha){
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
	
	setExitAnimationAlphaPositionStart = function(_startAlpha){
		_animationExitAlphaStart = _startAlpha;
	}
	
	setExitAnimationAlphaPositionEnd = function(_endAlpha){
		_animationExitAlphaEnd = _endAlpha;
	}
	#endregion
	

	#endregion
	
	
	#endregion
}