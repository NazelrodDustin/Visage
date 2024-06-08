/// @description Insert description here
// You can write your code in this editor

var thisMove = .01 * (keyboard_check(speedKey) ? 2.5 : 1);

if (keyboard_check(selectKey1)){
	if (keyboard_check(selectKey2)){
		testElement4._alpha += thisMove;
		if (testElement4._alpha > 1){
			testElement4._alpha = 1;	
		}
	}else{
		testElement3._alpha += thisMove;
		if (testElement3._alpha > 1){
			testElement3._alpha = 1;	
		}
	}
}else{
	if (keyboard_check(selectKey2)){
		testElement2._alpha += thisMove;
		if (testElement2._alpha > 1){
			testElement2._alpha = 1;	
		}
	}else{
		testElement1._alpha += thisMove;
		if (testElement1._alpha > 1){
			testElement1._alpha = 1;	
		}
	}	
}