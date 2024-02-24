/// @description Insert description here
// You can write your code in this editor

testContainer = new visageContainer();

visage_track_element(testContainer);


testContainer.setEntranceAnimationMovementCurve(elastic_out, false)
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
.setExitAnimationAlphaEnd(0.5);













