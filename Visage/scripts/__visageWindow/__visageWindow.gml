/// @title Windows
/// @category Documentation

/// @text Similar to a Container, the Window contains a group of GUI elements. The Window has potential of being moved, resized, closed, minimized, and restored. Each of these features can be configured as enabled or disabled. Resizing a window will not change the scale of elements inside of the window, but may allow other elements to expand or contract if elements are configured to behave as such.<br>

/// @constructor
/// @func visageWindow()
function visageWindow() : visageElement() constructor{
	_width = 128;
	_height = 128;
	_halign = 0;
	_valign = 0;
	
	_isResizable = false;
	_isMinimizable = false;
	_isMoveable = false;
	_isFocused = false;
	
	_focusedSprite = spr_default9SliceFocused
	_unfocusedSprite = spr_default9SliceUnfocused
	_alignment = VISAGE_ALIGNMENT.MIDDLE_CENTER;

	
	_update = function(){
		for (var i = 0; i < ds_list_size(_subElements); i++){
			_subElements[| i]._update();
		}
		
				var _oldWidth = _totalWidth;
		var _oldHeight = _totalHeight;
		
		getElementSize();
			
		for (var i = 0; i < ds_list_size(_subElements); i++){
			var subElement = _subElements[| i];
			_leftX = min(_leftX, subElement._leftX);
			_rightX = max(_rightX, subElement._rightX);
			_topY = min(_topY, subElement._topY);
			_bottomY = max(_bottomY, subElement._bottomY);
		}
			
		_totalWidth = _rightX - _leftX + 4;
		_totalHeight = _bottomY - _topY + 4;
			
		if (((_oldWidth != _totalWidth) || (_oldHeight != _totalHeight)) || !surface_exists(_elementSurface)){
			if (surface_exists(_elementSurface)){
				surface_resize(_elementSurface, _totalWidth, _totalHeight);
			}else{
				_elementSurface = surface_create(_totalWidth, _totalHeight);
			}
		}
		
		getElementVisibleDimensions();
		
		_halign = floor(-(((_alignment % 3) / 2) * (_width)));
		_valign = floor(-(((floor(_alignment / 3)) / 2) * (_height)));
	}
	
	getElementSize = function(){
		_leftX = _x + _halign
		_rightX = _leftX + _width;
		_topY = _y + _valign
		_bottomY = _topY + _height;
		_totalWidth = 0;
		_totalHeight = 0;
	}
	
	getElementVisibleDimensions = function(){
		_elementLeftDrawOffset = 0;
		_elementTopDrawOffset = 0; 
		_elementDrawWidth = _totalWidth;
		_elementDrawHeight = _totalHeight;	
	}
	
	/// @method drawElement()
	/// @desc Drawing logic for this element to be called in _draw()
	/// @returns {null}
	drawElement = function(){
		draw_sprite_stretched(_isFocused ? _focusedSprite : _unfocusedSprite, 0, -_leftX + _x + _halign + 2, -_topY + _y + _valign + 2, _width, _height);
		
		draw_rectangle((-_leftX + _x) - 3, (-_topY + _y) - 3, (-_leftX + _x) + 3, (-_topY + _y) + 3, false)
		
		var alignmentText = "";
		switch (floor(_alignment / 3)){
			case 0:
				alignmentText += "Top-";
				break;
				
			case 1:
				alignmentText += "Middle-";
				break;
				
			case 2:
				alignmentText += "Bottom-";
				break;
		}
		switch (_alignment % 3){
			case 0:
				alignmentText += "left";
				break;
				
			case 1:
				alignmentText += "center";
				break;
				
			case 2:
				alignmentText += "right";
				break;
		}
		
		var text = scribble(alignmentText + "\n(" + string(_leftX) + ", " + string(_rightX) + ")\n(" + string(_topY) + ", " + string(_bottomY) + ")\n(" + string(_x) + ", " + string(_y) + ")").align(fa_center, fa_middle).padding(5, 5, 5, 5);
		var xPos = (-_leftX + (_x + _halign) + (_width / 2));
		var yPos = (-_topY + (_y + _valign) + (_height / 2));
		var bbox = text.get_bbox(xPos, yPos);
		draw_rectangle(bbox.left, bbox.top, bbox.right, bbox.bottom, true);
		
		text.draw(xPos, yPos);
	}	
}

