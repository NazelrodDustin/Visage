/// @description Insert description here
// You can write your code in this editor
if live_call() return live_result;

_deltaTime = (keyboard_check_direct(vk_down) && VISAGE_DEBUG) ? (keyboard_check_released(vk_left) ? -16.67 : 0) + (keyboard_check_released(vk_right) ? 16.67 : 0) : delta_time / 1000;


for (var i = 0; i < array_length(_trackedElements); i++){
	_trackedElements[i]._updateSystem();
}