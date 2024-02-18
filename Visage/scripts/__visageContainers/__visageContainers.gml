/// @title Containers
/// @category Documentation

/// @text Containers are the base for any GUI element. Can control visibility, location, rotation, and scale for an entire group of GUI elements. The container is not a visible element, see window for a visible element with similar properties. <br>

#region /// @text ## Methods <br>

/// @func visage_container_create(config)
/// @desc Creates a new container based off a configuration profile.
/// @returns {struct} Container configuration profile.
function visage_container_create(){
	return new visageContainer();
}

/// @func visage_container_destroy(container)
/// @desc Destroys a previously created container.
/// @param {struct} container Container to destroy.
/// @returns {void}
function visage_container_destroy(_container){
	delete _container;
}

#region // Entrance animations

#region // Movement

/// @func visage_container_set_entrance_movement_animation(container, animationCurve, isReversed)
/// @desc Sets the movement animation curve for specified container.
/// @param {struct} container The container to set the movement animation in.
/// @param {Asset.GMAnimCurve} animationCurve The animation curve to set in the container.
/// @param {bool} isReversed Determines if the animation curve is read normally (false) or reversed (true)
/// @returns {void}
function visage_container_set_entrance_movement_animation(_container, _animationCurve, _isReversed){
	_container.setEntranceAnimationMovementCurve(_animationCurve, _isReversed);	
}

/// @func visage_container_set_entrance_movement_timing(container, duration, offset)
/// @desc Sets the movement animation duration and offset for specified container.
/// @param {struct} container The container to set the movement duration in.
/// @param {real} duration The animation duration (in ms) to set in the container.
/// @param {real} offset The starting offset (in ms) of the animation.
/// @returns {void}
function visage_container_set_entrance_movement_timing(_container, _duration, _offset){
	_container.setEntranceAnimationMovementDuration(_duration, _offset);	
}

/// @func visage_container_set_entrance_movement_position_start(container, startX, startY)
/// @desc Sets the starting movement position for specified container.
/// @param {struct} container The container to set the starting movement position in.
/// @param {real} startX The animation starting x position to set in the container.
/// @param {real} startY The animation starting y position to set in the container.
/// @returns {void}
function visage_container_set_entrance_movement_position_start(_container, _startX, _startY){
	_container.setEntranceAnimationMovementPositionStart(_startX, _startY);
}

/// @func visage_container_set_entrance_movement_position_end(container, endX, endY)
/// @desc Sets the ending movement position for specified container.
/// @param {struct} container The container to set the ending movement position in.
/// @param {real} endX The animation ending x position to set in the container.
/// @param {real} endY The animation ending y position to set in the container.
/// @returns {void}
function visage_container_set_entrance_movement_position_end(_container, _endX, _endY){
	_container.setEntranceAnimationMovementPositionEnd(_endX, _endY);
}

#endregion

#region // Rotation

/// @func visage_container_set_entrance_rotation_animation(container, animationCurve, isReversed)
/// @desc Sets the rotation animation curve for specified container.
/// @param {struct} container The container to set the rotation animation in.
/// @param {Asset.GMAnimCurve} animationCurve The animation curve to set in the container.
/// @param {bool} isReversed Determines if the animation curve is read normally (false) or reversed (true)
/// @returns {void}
function visage_container_set_entrance_rotation_animation(_container, _animationCurve, _isReversed){
	_container.setEntranceAnimationRotationCurve(_animationCurve, _isReversed);	
}

/// @func visage_container_set_entrance_rotation_timing(container, duration, offset)
/// @desc Sets the rotation animation duration and offset for specified container.
/// @param {struct} container The container to set the rotation duration in.
/// @param {real} duration The animation duration (in ms) to set in the container.
/// @param {real} offset The starting offset (in ms) of the animation.
/// @returns {void}
function visage_container_set_entrance_rotation_timing(_container, _duration, _offset){
	_container.setEntranceAnimationRotationDuration(_duration, _offset);	
}

/// @func visage_container_set_entrance_rotation_start(container, startAngle)
/// @desc Sets the starting rotation angle for specified container.
/// @param {struct} container The container to set the starting rotation angle in.
/// @param {real} startAngle The animation starting rotation angle to set in the container.
/// @returns {void}
function visage_container_set_entrance_rotation_start(_container, _startAngle){
	_container.setEntranceAnimationRotationStart(_startAngle);
}

/// @func visage_container_set_entrance_rotation_end(container, endAngle)
/// @desc Sets the ending rotation angle for specified container.
/// @param {struct} container The container to set the ending rotation angle in.
/// @param {real} endAngle The animation ending rotation angle to set in the container.
/// @returns {void}
function visage_container_set_entrance_rotation_end(_container, _endAngle){
	_container.setEntranceAnimationRotationEnd(_endAngle);
}

#endregion

#region // Scale

/// @func visage_container_set_entrance_scale_animation(container, animationCurve, isReversed)
/// @desc Sets the scale animation curve for specified container.
/// @param {struct} container The container to set the scale animation in.
/// @param {Asset.GMAnimCurve} animationCurve The animation curve to set in the container.
/// @param {bool} isReversed Determines if the animation curve is read normally (false) or reversed (true)
/// @returns {void}
function visage_container_set_entrance_scale_animation(_container, _animationCurve, _isReversed){
	_container.setEntranceAnimationScaleCurve(_animationCurve, _isReversed);	
}

/// @func visage_container_set_entrance_scale_timing(container, duration, offset)
/// @desc Sets the scale animation duration and offset for specified container.
/// @param {struct} container The container to set the scale duration in.
/// @param {real} duration The animation duration (in ms) to set in the container.
/// @param {real} offset The starting offset (in ms) of the animation.
/// @returns {void}
function visage_container_set_entrance_scale_timing(_container, _duration, _offset){
	_container.setEntranceAnimationScaleDuration(_duration, _offset);	
}

/// @func visage_container_set_entrance_scale_start(container, startScale)
/// @desc Sets the starting scale for specified container.
/// @param {struct} container The container to set the starting scale in.
/// @param {real} startScale The animation starting scale to set in the container.
/// @returns {void}
function visage_container_set_entrance_scale_start(_container, _startScale){
	_container.setEntranceAnimationScaleStart(_startScale);
}

/// @func visage_container_set_entrance_scale_end(container, endScale)
/// @desc Sets the ending scale for specified container.
/// @param {struct} container The container to set the ending scale in.
/// @param {real} endScale The animation ending scale to set in the container.
/// @returns {void}
function visage_container_set_entrance_scale_end(_container, _endScale){
	_container.setEntranceAnimationScaleEnd(_endScale);
}

#endregion

#region // Alpha

/// @func visage_container_set_entrance_alpha_animation(container, animationCurve, isReversed)
/// @desc Sets the alpha animation curve for specified container.
/// @param {struct} container The container to set the scale animation in.
/// @param {Asset.GMAnimCurve} animationCurve The animation curve to set in the container.
/// @param {bool} isReversed Determines if the animation curve is read normally (false) or reversed (true)
/// @returns {void}
function visage_container_set_entrance_alpha_animation(_container, _animationCurve, _isReversed){
	_container.setEntranceAnimationAlphaCurve(_animationCurve, _isReversed);	
}

/// @func visage_container_set_entrance_alpha_timing(container, duration, offset)
/// @desc Sets the alpha animation duration and offset for specified container.
/// @param {struct} container The container to set the alpha duration in.
/// @param {real} duration The animation duration (in ms) to set in the container.
/// @param {real} offset The starting offset (in ms) of the animation.
/// @returns {void}
function visage_container_set_entrance_alpha_timing(_container, _duration, _offset){
	_container.setEntranceAnimationAlphaDuration(_duration, _offset);	
}

/// @func visage_container_set_entrance_alpha_start(container, startAlpha)
/// @desc Sets the starting alpha for specified container.
/// @param {struct} container The container to set the starting alpha in.
/// @param {real} startAlpha The animation starting alpha to set in the container.
/// @returns {void}
function visage_container_set_entrance_alpha_start(_container, _startAlpha){
	_container.setEntranceAnimationAlphaStart(_startAlpha);
}

/// @func visage_container_set_entrance_alpha_end(container, endAlpha)
/// @desc Sets the starting alpha for specified container.
/// @param {struct} container The container to set the ending alpha in.
/// @param {real} endAlpha The animation ending alpha to set in the container.
/// @returns {void}
function visage_container_set_entrance_alpha_end(_container, _endAlpha){
	_container.setEntranceAnimationAlphaEnd(_endAlpha);
}

#endregion

#endregion

#region // Exit animations

#region // Movement

/// @func visage_container_set_exit_movement_animation(container, animationCurve, isReversed)
/// @desc Sets the movement animation curve for specified container.
/// @param {struct} container The container to set the movement animation in.
/// @param {Asset.GMAnimCurve} animationCurve The animation curve to set in the container.
/// @param {bool} isReversed Determines if the animation curve is read normally (false) or reversed (true)
/// @returns {void}
function visage_container_set_exit_movement_animation(_container, _animationCurve, _isReversed){
	_container.setExitAnimationMovementCurve(_animationCurve, _isReversed);	
}

/// @func visage_container_set_exit_movement_timing(container, duration, offset)
/// @desc Sets the movement animation duration and offset for specified container.
/// @param {struct} container The container to set the movement duration in.
/// @param {real} duration The animation duration (in ms) to set in the container.
/// @param {real} offset The starting offset (in ms) of the animation.
/// @returns {void}
function visage_container_set_exit_movement_timing(_container, _duration, _offset){
	_container.setExitAnimationMovementDuration(_duration, _offset);	
}

/// @func visage_container_set_exit_movement_position_start(container, startX, startY)
/// @desc Sets the starting movement position for specified container.
/// @param {struct} container The container to set the starting movement position in.
/// @param {real} startX The animation starting x position to set in the container.
/// @param {real} startY The animation starting y position to set in the container.
/// @returns {void}
function visage_container_set_exit_movement_position_start(_container, _startX, _startY){
	_container.setExitAnimationMovementPositionStart(_startX, _startY);
}

/// @func visage_container_set_exit_movement_position_end(container, endX, endY)
/// @desc Sets the ending movement position for specified container.
/// @param {struct} container The container to set the ending movement position in.
/// @param {real} endX The animation ending x position to set in the container.
/// @param {real} endY The animation ending y position to set in the container.
/// @returns {void}
function visage_container_set_exit_movement_position_end(_container, _endX, _endY){
	_container.setExitAnimationMovementPositionEnd(_endX, _endY);
}

#endregion

#region // Rotation

/// @func visage_container_set_exit_rotation_animation(container, animationCurve, isReversed)
/// @desc Sets the rotation animation curve for specified container.
/// @param {struct} container The container to set the rotation animation in.
/// @param {Asset.GMAnimCurve} animationCurve The animation curve to set in the container.
/// @param {bool} isReversed Determines if the animation curve is read normally (false) or reversed (true)
/// @returns {void}
function visage_container_set_exit_rotation_animation(_container, _animationCurve, _isReversed){
	_container.setExitAnimationRotationCurve(_animationCurve, _isReversed);	
}

/// @func visage_container_set_exit_rotation_timing(container, duration, offset)
/// @desc Sets the rotation animation duration and offset for specified container.
/// @param {struct} container The container to set the rotation duration in.
/// @param {real} duration The animation duration (in ms) to set in the container.
/// @param {real} offset The starting offset (in ms) of the animation.
/// @returns {void}
function visage_container_set_exit_rotation_timing(_container, _duration, _offset){
	_container.setExitAnimationRotationDuration(_duration, _offset);	
}

/// @func visage_container_set_exit_rotation_start(container, startAngle)
/// @desc Sets the starting rotation angle for specified container.
/// @param {struct} container The container to set the starting rotation angle in.
/// @param {real} startAngle The animation starting rotation angle to set in the container.
/// @returns {void}
function visage_container_set_exit_rotation_start(_container, _startAngle){
	_container.setExitAnimationRotationStart(_startAngle);
}

/// @func visage_container_set_exit_rotation_end(container, endAngle)
/// @desc Sets the ending rotation angle for specified container.
/// @param {struct} container The container to set the ending rotation angle in.
/// @param {real} endAngle The animation ending rotation angle to set in the container.
/// @returns {void}
function visage_container_set_exit_rotation_end(_container, _endAngle){
	_container.setExitAnimationRotationEnd(_endAngle);
}

#endregion

#region // Scale

/// @func visage_container_set_exit_scale_animation(container, animationCurve, isReversed)
/// @desc Sets the scale animation curve for specified container.
/// @param {struct} container The container to set the scale animation in.
/// @param {Asset.GMAnimCurve} animationCurve The animation curve to set in the container.
/// @param {bool} isReversed Determines if the animation curve is read normally (false) or reversed (true)
/// @returns {void}
function visage_container_set_exit_scale_animation(_container, _animationCurve, _isReversed){
	_container.setExitAnimationScaleCurve(_animationCurve, _isReversed);	
}

/// @func visage_container_set_exit_scale_timing(container, duration, offset)
/// @desc Sets the scale animation duration and offset for specified container.
/// @param {struct} container The container to set the scale duration in.
/// @param {real} duration The animation duration (in ms) to set in the container.
/// @param {real} offset The starting offset (in ms) of the animation.
/// @returns {void}
function visage_container_set_exit_scale_timing(_container, _duration, _offset){
	_container.setExitAnimationScaleDuration(_duration, _offset);	
}

/// @func visage_container_set_exit_scale_start(container, startScale)
/// @desc Sets the starting scale for specified container.
/// @param {struct} container The container to set the starting scale in.
/// @param {real} startScale The animation starting scale to set in the container.
/// @returns {void}
function visage_container_set_exit_scale_start(_container, _startScale){
	_container.setExitAnimationScaleStart(_startScale);
}

/// @func visage_container_set_exit_scale_end(container, endScale)
/// @desc Sets the ending scale for specified container.
/// @param {struct} container The container to set the ending scale in.
/// @param {real} endScale The animation ending scale to set in the container.
/// @returns {void}
function visage_container_set_exit_scale_end(_container, _endScale){
	_container.setExitAnimationScaleEnd(_endScale);
}

#endregion

#region // Alpha

/// @func visage_container_set_exit_alpha_animation(container, animationCurve, isReversed)
/// @desc Sets the alpha animation curve for specified container.
/// @param {struct} container The container to set the scale animation in.
/// @param {Asset.GMAnimCurve} animationCurve The animation curve to set in the container.
/// @param {bool} isReversed Determines if the animation curve is read normally (false) or reversed (true)
/// @returns {void}
function visage_container_set_exit_alpha_animation(_container, _animationCurve, _isReversed){
	_container.setExitAnimationAlphaCurve(_animationCurve, _isReversed);	
}

/// @func visage_container_set_exit_alpha_timing(container, duration, offset)
/// @desc Sets the alpha animation duration and offset for specified container.
/// @param {struct} container The container to set the alpha duration in.
/// @param {real} duration The animation duration (in ms) to set in the container.
/// @param {real} offset The starting offset (in ms) of the animation.
/// @returns {void}
function visage_container_set_exit_alpha_timing(_container, _duration, _offset){
	_container.setExitAnimationAlphaDuration(_duration, _offset);	
}

/// @func visage_container_set_exit_alpha_start(container, startAlpha)
/// @desc Sets the starting alpha for specified container.
/// @param {struct} container The container to set the starting alpha in.
/// @param {real} startAlpha The animation starting alpha to set in the container.
/// @returns {void}
function visage_container_set_exit_alpha_start(_container, _startAlpha){
	_container.setExitAnimationAlphaStart(_startAlpha);
}

/// @func visage_container_set_exit_alpha_end(container, endAlpha)
/// @desc Sets the starting alpha for specified container.
/// @param {struct} container The container to set the ending alpha in.
/// @param {real} endAlpha The animation ending alpha to set in the container.
/// @returns {void}
function visage_container_set_exit_alpha_end(_container, _endAlpha){
	_container.setExitAnimationAlphaEnd(_endAlpha);
}

#endregion

#endregion
