/// @description Insert description here
// You can write your code in this editor

var thisMove = moveSpeed * keyboard_check(vk_shift) ? 2.5 : 1;

if (keyboard_check(vk_control)){
	testContainer2._x -= thisMove;
}else{
	testContainer._x -= thisMove;
}
