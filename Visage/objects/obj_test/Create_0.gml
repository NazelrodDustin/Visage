/// @description Insert description here
// You can write your code in this editor

moveSpeed = 1;
speedKey = vk_space;
selectKey1 = vk_alt;
selectKey2 = vk_control;

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

	testElement1 = new visageElement();
	testElement2 = new visageElement();
	testElement3 = new visageElement();
	testElement4 = new visageElement();
	
	visageTrackElement(testElement1);
	testElement1.addSubElement(testElement2);
	testElement2.addSubElement(testElement3);
	//testElement1.addSubElement(testElement4);
	
	testElement1.transform.setTranslation(0, 0).setRotation(48).setScale(1.11, 0.705).setAlpha(1);
	testElement1.animation.startTransform.setTranslation(-256, 0).setRotation(90).setScale(0, 0).setAlpha(0.5);
	testElement1.animation.endTransform.setTranslation(256, 0).setRotation(0).setScale(1, 1).setAlpha(1);
	testElement1.animation.curveTimings.translation.x.setCurve(elastic_out).setDuration(750);
	testElement1.animation.curveTimings.translation.y.setCurve(elastic_out).setDuration(750);
	testElement1.animation.curveTimings.rotation.setCurve(elastic_out).setDuration(750).setDelay(50);
	testElement1.animation.curveTimings.scale.x.setCurve(elastic_out).setDuration(500);
	testElement1.animation.curveTimings.scale.y.setCurve(elastic_out).setDuration(500);
	testElement1.animation.curveTimings.alpha.setCurve(ease_in_and_out).setDuration(400).setDelay(100);
	testElement1.addAnchorPoint(10, 100);
	
	testElement2.setAnchorPointIndex(1);
	testElement2.transform.setTranslation(-64, -116).setRotation(14.5).setScale(1.29, 1).setAlpha(1);
	testElement2.animation.copy(testElement1.animation);
	testElement2.animation.startTransform.setTranslation(-64, 0).setScale(0.5, 0.5).setAlpha(0.75);
	testElement2.animation.endTransform.setTranslation(64, 0);
	
	testElement3.transform.setTranslation(49, 255).setRotation(-123.4).setScale(1.99, 1).setAlpha(1);
	testElement3.animation.copy(testElement2.animation);
	testElement3.animation.startTransform.setTranslation(0, -128).setScale(1, 1).setAlpha(1);
	testElement3.animation.endTransform.setTranslation(0, 128);
}