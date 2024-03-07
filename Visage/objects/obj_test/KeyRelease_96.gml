/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_direct(vk_add)){
	testSubWindow._isFocused = !testSubWindow._isFocused;
}else{
	testWindow._isFocused = !testWindow._isFocused;
}