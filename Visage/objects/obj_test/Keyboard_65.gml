/// @description Insert description here
// You can write your code in this editor

var thisMove = moveSpeed * (keyboard_check(speedKey) ? 2.5 : 1);

if (keyboard_check(selectKey1)){
	if (keyboard_check(selectKey2)){
		testElement4.transform.translation.x -= thisMove;
	}else{
		testElement3.transform.translation.x -= thisMove;
	}
}else{
	if (keyboard_check(selectKey2)){
		testElement2.transform.translation.x -= thisMove;
	}else{
		testElement1.transform.translation.x -= thisMove;
	}
}