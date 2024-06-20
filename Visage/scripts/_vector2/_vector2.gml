/// @Title vector2
/// @category misc

/// @text Visage requires a vector2 implementation. If you already have a vector2 implementation in your game, you can remove the provided implementation. However, please ensure that your pre-existing implementation is at least as robust as the provdided version, and uses the same naming convention. Otherwise it is recommended to use this implementation.

/// @constructor
/// @function vector2
function vector2(_x, _y) constructor{
	
	x = _x;
	y = _y;
	
	#region Copy
	/// @function copy(vector)
	/// @desc Copies provided vector's components to this vector's components.
	/// @param {struct} vector The vector to copy from.
	/// @returns {null}
	copy = function(_vector){
		x = _vector.x;
		y = _vector.y;
	}#endregion
	
	#region Set
	/// @function set(x, y)
	/// @desc Sets this vector's components.
	/// @param {real} x The new value for this vector's x component.
	/// @param {real} y The new value for this vector's y component.
	/// @returns {null}
	set = function(_x, _y){
		x = _x;
		y = _y;
	}#endregion
	
	#region Set X
	/// @function setX(x)
	/// @desc Sets this vector's x component.
	/// @param {real} x The new value for this vector's x component.
	/// @returns {null}
	setX = function(_x){
		x = _x;
	}#endregion
	
	#region Set Y
	/// @function setY(y)
	/// @desc Sets this vector's y component.
	/// @param {real} y The new value for this vector's y component.
	/// @returns {null}
	setY = function(_y){
		y = _y;	
	}#endregion
	
	#region Add
	/// @function add(vector)
	/// @desc Adds provided vector's compnents from this vector's components.
	/// @param {real} vector The vector to use for addition
	/// @returns {null}
	add = function(_vector){
		x += _vector.x;
		y += _vector.y;
	}#endregion
	
	#region Subtract
	/// @function subtract(vector)
	/// @desc Subtracts provided vector's compnents from this vector's components.
	/// @param {real} vector The vector to use for subtraction
	/// @returns {null}
	subtract = function(_vector){
		x -= _vector.x;
		y -= _vector.y;
	}#endregion

	#region Multiply
	/// @function multiply(scalar)
	/// @desc Multiplies this vector's components by provided scalar
	/// @param {real} scalar The value to use for multiplication
	/// @returns {null}
	multiply = function(_scalar){
		x *= _scalar;
		y *= _scalar;
	}#endregion
	
	#region Divide
	/// @function divide(scalar)
	/// @desc Divides this vector's components by provided scalar
	/// @param {real} scalar The value to use for division
	/// @returns {null}
	divide = function(_scalar){
		x /= _scalar;
		y /= _scalar;
	}#endregion
	
	#region Normalize
	/// @function normalize()
	/// @desc Normalizes this vector. This function will modify the actual components. For a function that does not change this vector's components, see vector2.normalized().
	/// @returns {null}
	normalize = function(){
		if (x != 0 || y != 0){
			var _len = sqrt(sqr(x) + sqr(y));
			
            x /= _len;
            y /= _len;
        }
	}#endregion
	
	#region Normalized
	/// @function normalized()
	/// @desc returns a new vector with the normalized components of this vector without modifiying this vector. For a function that changes this vector's components, see vector2.normalize().
	/// @returns {struct} Vector2 containing this vector's normalized components.
	normalized = function(){
		if (x != 0 || y != 0){
            var _len = sqrt(sqr(x) + sqr(y));
      
            return new vector2(x / _len, y / _len);
        }
	}#endregion	
	
	#region Dot
	/// @function dot(vector)
	/// @desc Gets the dot product of this vector and provided vector.
	/// @param {struct} vector Provided vector to calcualte dot product with.
	/// @returns {real} Scalar dot product value.
	dot = function(_vector){
		return (x * _vector.x) + (y * _vector.y);
	}#endregion
	
	#region Cross
	/// @function cross(vector)
	/// @desc Gets the 2D cross product of this vector and provided vector.
	/// @param {struct} vector Provided vector to calculate cross product with.
	/// @returns {real} Scalar 2D Cross product value.
	cross = function(_vector){
		return (x * _vector.y) - (y * _vector.x);
	}#endregion;
}