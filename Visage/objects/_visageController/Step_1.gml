/// @description Insert description here
// You can write your code in this editor
if live_call() return live_result;

_deltaTime = delta_time / 1000000;


for (var i = 0; i < array_length(_trackedElements); i++){
	_trackedElements[i]._updateSystem();
}