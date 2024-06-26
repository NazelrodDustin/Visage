/// @description Insert description here
// You can write your code in this editor

moveSpeed = 10;

if (!visageInitialized()){
	_resetTimeSource = time_source_create(time_source_global, 1, time_source_units_frames, 
		function() {
			event_perform(ev_create, 0);
		}, [], 1);

	time_source_start(_resetTimeSource);
	
	_visageLog("System not initialized");
}else{
	show_debug_overlay(true);
	gpu_set_tex_filter(false);

	window_set_size(floor(display_get_width() / 1.25), floor(display_get_height() / 1.25));
	surface_resize(application_surface, window_get_width(), window_get_height());

	testContainer = new visageContainer();

	visageTrackElement(testContainer.setEntranceAnimationMovementCurve(elastic_out, false)
	.setEntranceAnimationMovementTiming(750, 0)
	.setEntranceAnimationMovementPositionStart((window_get_width() / 2) - 256, window_get_height() / 2)
	.setEntranceAnimationMovementPositionEnd((window_get_width() / 2) + 256, window_get_height() / 2)
	.setEntranceAnimationRotationCurve(elastic_out, false)
	.setEntranceAnimationRotationTiming(750, 50)
	.setEntranceAnimationRotationStart(90)
	.setEntranceAnimationRotationEnd(0)
	.setEntranceAnimationScaleCurve(elastic_out, false)
	.setEntranceAnimationScaleTiming(500, 0)
	.setEntranceAnimationScaleStart(0)
	.setEntranceAnimationScaleEnd(1)
	.setEntranceAnimationAlphaCurve(ease_in_and_out, false)
	.setEntranceAnimationAlphaTiming(400, 100)
	.setEntranceAnimationAlphaStart(0.5)
	.setEntranceAnimationAlphaEnd(1)
	.setExitAnimationMovementCurve(ease_in_and_out, false)
	.setExitAnimationMovementTiming(750, 0)
	.setExitAnimationMovementPositionStart((window_get_width() / 2) + 256, window_get_height() / 2)
	.setExitAnimationMovementPositionEnd((window_get_width() / 2) - 256, window_get_height() / 2)
	.setExitAnimationRotationCurve(ease_in_and_out, false)
	.setExitAnimationRotationTiming(400, 200)
	.setExitAnimationRotationStart(0)
	.setExitAnimationRotationEnd(90)
	.setExitAnimationScaleCurve(ease_in_and_out, false)
	.setExitAnimationScaleTiming(250, 400)
	.setExitAnimationScaleStart(1)
	.setExitAnimationScaleEnd(0)
	.setExitAnimationAlphaCurve(ease_in_and_out, false)
	.setExitAnimationAlphaTiming(250, 250)
	.setExitAnimationAlphaStart(1)
	.setExitAnimationAlphaEnd(0.5));
	
	testContainer2 = new visageContainer();
	
	testContainer.addSubElement(testContainer2);
	
	testContainer2.setEntranceAnimationMovementCurve(ease_in_and_out, false)
	.setEntranceAnimationMovementPositionStart(-128, -128)
	.setEntranceAnimationMovementPositionEnd(128, 128)
	.setEntranceAnimationMovementTiming(10000, 750)
	.setEntranceAnimationAlphaCurve(ease_in_and_out, false)
	.setEntranceAnimationAlphaStart(0.0)
	.setEntranceAnimationAlphaEnd(1.0)
	.setEntranceAnimationAlphaTiming(500,250)
	.setEntranceAnimationRotationCurve(ease_in_and_out, false)
	.setEntranceAnimationRotationStart(360)
	.setEntranceAnimationRotationEnd(0)
	.setEntranceAnimationRotationTiming(10000, 1000);
}