/// @description Insert description here
// You can write your code in this editor

var thisMove = .01 * (keyboard_check(speedKey) ? 2.5 : 1);

if (keyboard_check(selectKey1)){
	if (keyboard_check(selectKey2)){
		testElement4.transform.scale.y -= thisMove;
	}else{
		testElement3.transform.scale.y -= thisMove;
	}
}else{
	if (keyboard_check(selectKey2)){
		testElement2.transform.scale.y -= thisMove;
	}else{
		testElement1.transform.scale.y -= thisMove;
	}	
}