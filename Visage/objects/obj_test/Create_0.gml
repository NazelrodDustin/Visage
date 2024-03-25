/// @description Insert description here
// You can write your code in this editor

gpu_set_tex_filter(false);
window_set_size(floor(display_get_width() / 1.25), floor(display_get_height() / 1.25));
surface_resize(application_surface, window_get_width(), window_get_height());

testContainer = new visageContainer();

visage_track_element(testContainer.setEntranceAnimationMovementCurve(elastic_out, false)
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


testWindow1 = new visageWindow();
testWindow2 = new visageWindow();

testSubWindow1 = new visageWindow();
testSubWindow2 = new visageWindow();

testSubWindow3 = new visageWindow();
testSubWindow4 = new visageWindow();


testWindow1.addSubElement(testSubWindow1);
//testWindow1.addSubElement(testSubWindow2);
//testWindow2.addSubElement(testSubWindow3);
//testWindow2.addSubElement(testSubWindow4);

//testContainer.addSubElement(testWindow1);
//testContainer.addSubElement(testWindow2);

testWindow1._x = irandom_range(-100, 100);
testWindow1._y = irandom_range(-100, 100);
testWindow1._width = irandom_range(200, 400);
testWindow1._height = irandom_range(200, 400);

testWindow2._x = irandom_range(-100, 100);
testWindow2._y = irandom_range(-100, 100);
testWindow2._width = irandom_range(200, 400);
testWindow2._height = irandom_range(200, 400);


editWindowIndex = 0;
editWindow = testWindow1;

testContainer.addSubElement(testWindow1);

show_debug_overlay(true);