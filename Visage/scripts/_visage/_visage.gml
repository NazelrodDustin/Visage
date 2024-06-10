///@title Utilites
///@category Documentation

if (VISAGE_AUTO_INIT){
	global._visageInitTimeSource = time_source_create(time_source_global, 1, time_source_units_frames, _visageInit, [], 1);

	function _visageInit(){
		instance_create_depth(0, 0, 0, _visageController);	
	}

	time_source_start(global._visageInitTimeSource);	
}

#region /// @text ## **Enums**
/// ### VISAGE_ALIGNMENT
///|  |
///|---|
///| TOP_LEFT |
///| TOP_CENTER |
///| TOP_RIGHT |
///| MIDDLE_LEFT |
///| MIDDLE_CENTER |
///| MIDDLE_RIGHT |
///| BOTTOM_LEFT |
///| BOTTOM_CENTER |
///| BOTTOM_RIGHT |
#endregion

enum VISAGE_ALIGNMENT {
	TOP_LEFT,
	TOP_CENTER,
	TOP_RIGHT,
	MIDDLE_LEFT,
	MIDDLE_CENTER,
	MIDDLE_RIGHT,
	BOTTOM_LEFT,
	BOTTOM_CENTER,
	BOTTOM_RIGHT
}

#region /// @function visageInitialized()
/// @desc Returns if Visage is initialized.
/// @returns {bool} True if Visage is initialized, False otherwise.
function visageInitialized(){
	return instance_exists(_visageController);	
}#endregion

#region /// @function visageTrackElement(element)
/// @desc Adds element to be tracked by system.
/// @param element {struct} The element to be tracked.
/// @returns {null}
function visageTrackElement(element){
	_visageController._trackElement(element);
}#endregion

#region /// @function visageRemoveTrackedElement(element)
/// @desc Removes element from being tracked by system.
/// @param element {struct} The element to be removed.
/// @returns {null}
function visageRemoveTrackedElement(element){
	_visageController._removeTrackedElement(element);
}#endregion

#region /// @function visageDeltaTime()
/// @desc Gets the time since last frame.
/// @returns {real} Time since last frame.
function visageDeltaTime(){
	return _visageController._deltaTime;	
}#endregion

/// @ignore true

#region /// @function _visageIncrementSort(priority, element)
/// @desc [Internal] Increments all (except the element provided) elements priorties above a provided priority.
/// @param priority {real} The minimum priority to be incremented.
/// @param element {struct} The element that is calling this function, who's priority should not be incremented.
/// @returns {null}
function _visageIncrementSort(priority, element){
	_visageController._incrementSort(priority, element);	
}#endregion

#region /// @function function _visagePrioritySort(element1, element2)
/// @desc Algorithm for sorting the priority of elements.
/// @param element1 {struct} The first element to be compared for sorting.
/// @param element2 {struct} The second element to be compared for sorting.
/// @returns {real} -1 if element1's priorty is higher, 1 if element2's priority is higher, or 0 if priorities are equal.
function _visagePrioritySort(element1, element2){
	var diff = (element1._priority - element2._priority) * -1;
	
	return sign(diff);
}#endregion

#region /// @function _visageLog(text, [verboseOnly])
/// @desc Logs a debug message to the console indicating relationship to Visage.
/// @param text {string} The text to be output to the console.
/// @param verboseOnly {string} (Optional: default = false) If true, message will only be logged when Visage is in verbose mode.
/// @returns {null}
function _visageLog(_text, _verboseOnly = false){
	if (VISAGE_DEBUG && (VISAGE_VERBOSE || !_verboseOnly)){
		show_debug_message("Visage: " + string(_text));
	}
}#endregion

/// @ignore false

/// @constructor
#region /// @func visageTransform()
function visageTransform() constructor{
	#region // Variable Declaration
	// Private //
	
	/// @ignore true
	/// @var {struct} self This transform
	_self = self;
	
	
	// Public //
	
	/// @ignore false
	/// @var {struct} translation (x, y) position of transform
	translation = {
		x: 0,
		y: 0
	};
	/// @var {real} rotation rotation angle (in degrees) of transform
	rotation =  0;
	/// @var {struct} scale (x, y) scale of transform
	scale = {
		x: 1,
		y: 1
	};
	/// @var {struct} alpha alpha of items in this transform
	alpha = 1;
	#endregion
	
	#region /// @method copy(transform)
	/// @desc Copies data from provided transform to this one.
	/// @param {struct} transform The transform to copy data from.
	/// @returns {struct} This transform for method chaining.
	copy = function(_transform){
		translation.x = _transform.translation.x;
		translation.y = _transform.translation.y;
		rotation = _transform.rotation;
		scale.x = _transform.scale.x;
		scale.y = _transform.scale.y;
		alpha = _transform.alpha;
		return _self;
	}#endregion
	
	#region /// @method translate(x, y)
	/// @desc Updates transform's translation component by provided (x, y) values.
	/// @param {real} x The change in x translation.
	/// @param {real} y The change in y translation.
	/// @returns {struct} This transform for method chaining.
	translate = function(_x, _y){
		translation.x += _x;
		translation.y += _y;
		return _self;
	}#endregion
	
	#region /// @method rotate(angle)
	/// @desc Updates transform's rotation component by provided angle value.
	/// @param {real} angle The change in rotation.
	/// @returns {struct} This transform for method chaining.
	rotate = function(_angle){
		rotation += _angle;
		return _self;
	}#endregion
	
	#region /// @method setTranslation(x, y)
	/// @desc Sets transform's translation component to provided (x, y) values.
	/// @param {real} x The x value to set.
	/// @param {real} y The y value to set.
	/// @returns {struct} This transform for method chaining.
	setTranslation = function(_x, _y){
		translation.x = _x;
		translation.y = _y;
		return _self;
	}#endregion
	
	#region /// @method setTranslationX(x)
	/// @desc Sets transform's translation x component to provided value.
	/// @param {real} x The x value to set.
	/// @returns {struct} This transform for method chaining.
	setTranslationX = function(_x){
		translation.x = _x;
		return _self;
	}#endregion
	
	#region /// @method setTranslationY(y)
	/// @desc Sets transform's translation y component to provided value.
	/// @param {real} y The y value to set.
	/// @returns {struct} This transform for method chaining.
	setTranslationY = function(_y){
		translation.y = _y;	
		return _self;
	}#endregion
	
	#region /// @method setRotation(angle)
	/// @desc Sets transform's rotation component to provided angle value.
	/// @param {real} angle The angle value to set
	/// @returns {struct} This transform for method chaining.
	setRotation = function(_angle){
		rotation = _angle;
		return _self;
	}#endregion
	
	#region /// @method setScale(x, y)
	/// @desc Sets transform's scale component to provided (x, y) values.
	/// @param {real} x The x value to set.
	/// @param {real} y The y value to set.
	/// @returns {struct} This transform for method chaining.
	setScale = function(_x, _y){
		scale.x = _x;
		scale.y = _y;
		return _self;
	}#endregion
	
	#region /// @method setScaleX(x)
	/// @desc Sets transform's scale x component to provided value.
	/// @param {real} x The x value to set.
	/// @returns {struct} This transform for method chaining.
	setScaleX = function(_x){
		scale.x = _x;
		return _self;
	}#endregion
	
	#region /// @method setScaleY(y)
	/// @desc Sets transform's scale y component to provided value.
	/// @param {real} y The y value to set.
	/// @returns {struct} This transform for method chaining.
	setScaleY = function(_y){
		scale.y = _y;
		return _self;
	}#endregion
	
	#region /// @method setAlpha(alpha)
	/// @desc Sets transform's alpha component to provided value.
	/// @param {real} alpha The alpha value to set
	/// @returns {struct} This transform for method chaining.
	setAlpha = function(_alpha){
		alpha = _alpha;
		return _self;
	}#endregion
	
	#region /// @method toString()
	/// @desc formats this transform as a beautified string.
	/// @returns {string}
	toString = function(){
		return string("visageTransform:\n|- Translation:\n|\t|- x: {0}\n|\t|- y: {1}\n|- Rotation: {2}\n|- Scale:\n|\t|- x: {3}\n|\t|- y: {4}\n|- Alpha: {4}", translation.x, translation.y, rotation, scale.x, scale.y, alpha);
	}#endregion
}
#endregion

/// @constructor
#region /// @func visageCurveTiming()
function visageCurveTiming() constructor{
	#region // Variable Declaration
	// Private //
	
	/// @ignore true
	/// @var {struct} self This transform
	_self = self;
	/// @var {Asset.GMAnimCurve} curve The animation curve for this animation channel
	_curve = linear;
	/// @var {boolean} reversed If the curve should be followed forward (0-1: false) or reversed (1-0 : true)
	_reversed = false;
	/// @var {boolean} playing If the curveTiming is currently playing
	_playing = false;
	/// @var {real} progress The progress (0-1) of the animation
	_progress = 0;
	/// @var {real} duration The duration of the animation (in ms, never less than 1)
	_duration = 1;
	/// @var {real} delay The delay before the the animation begins (in ms, never negative)
	_delay = 0;
	/// @var {real} elapsedTime The time since elapsed since beginning to play (in ms, can be negative if a main delay is provided when calling .play())
	_elapsedTime = 0; //In ms.
	
	// Public //
	
	///@ignore false
	
	#endregion
	
	#region /// @method copy(curveTiming)
	/// @desc Copies data from provided curveTiming to this one.
	/// @param {struct} curveTiming The curveTiming to copy data from.
	/// @returns {struct} This curveTiming for method chaining.
	copy = function(_curveTiming){
		_curve = _curveTiming._curve;
		_reversed = _curveTiming._reversed;
		_duration = _curveTiming._duration;
		_delay = _curveTiming._delay;
		return _self;
	}#endregion
	
	#region /// @method setCurve(curve)
	/// @desc Sets the animation curve.
	/// @param {Asset.GMAnimCurve} curve The curve to set.
	/// @returns {struct} This curveTiming for method chaining.
	setCurve = function(_curve){
		_self._curve = _curve;
		return _self;
	}#endregion
	
	#region /// @method setReversed(reversed)
	/// @desc Sets if the animation curve is reversed.
	/// @param {boolean} reversed True if reversed, or false if not.
	/// @returns {struct} This curveTiming for method chaining.
	setReversed = function(_reversed){
		_self._reversed = _reversed;
		return _self;
	}#endregion
	
	#region /// @method setDelay(delay)
	/// @desc Sets the delay of this curveTiming.
	/// @param {real} delay Time (in ms) to wait before starting animation. >= 0
	/// @returns {struct} This curveTiming for method chaining.
	setDelay = function(_delay){
		_self._delay = max(0, _delay);
		return _self;
	}#endregion
	
	#region /// @method setDelay(duration)
	/// @desc Sets the duration of this curveTiming.
	/// @param {real} duration Time (in ms) animation will take to finish after any delay. >= 1
	/// @returns {struct} This curveTiming for method chaining.
	setDuration = function(_duration){
		_self._duration = max(1, _duration);
		return _self;
	}#endregion
	
	#region /// @method getPosition()
	/// @desc Gets the position of this curveTiming's curve at the current progress.
	/// @returns {real} The value on the curve at the current progress.
	getPosition = function(){
		if (_playing){ 
			
			_elapsedTime += visageDeltaTime();
			//show_debug_message(string("Time elapsed: {0}", _elapsedTime));
			_progress = clamp(max(_elapsedTime - _delay, 0) / _duration, 0, 1);
		}
		
		if (_progress >= 1){
			stop();
			_progress = 1;
		}
		
		return animcurve_channel_evaluate(animcurve_get_channel(_curve, 0), (_reversed ? 1 - _progress : _progress));
	}#endregion
	
	#region /// @method isPlaying()
	/// @desc Returns if the curveTiming is playing.
	/// @returns {boolean} True if playing, False if not.
	isPlaying = function(){
		return _playing;	
	}#endregion

	#region /// @method play(delay)
	/// @desc Begins the curveTiming's animation.
	/// @param {real} delay The time (in ms) to delay in addition to this curveTiming's individual delay.
	/// @returns {null}
	play = function(_delay){
		_elapsedTime = -_delay;
		_playing = true;
	}#endregion
	
	#region /// @method pause()
	/// @desc Pauses the curveTiming's animation.
	/// @returns {null}
	pause = function(){
		_playing = false;
	}#endregion
	
	#region /// @method resume()
	/// @desc Resumes the curveTiming's animation.
	/// @returns {null}
	resume = function(){
		_playing = true;
	}#endregion
	
	#region /// @method stop()
	/// @desc Stops and resets the curveTiming's animation.
	/// @returns {null}
	stop = function(){
		_playing = false;
		reset();
	}#endregion
	
	#region	/// @method stop()
	/// @desc Resets the curveTiming's animation.
	/// @returns {null}
	reset = function(){
		_elapsedTime = 0;	
	}#endregion
}#endregion

/// @constructor
#region/// @func visageAnimation()
function visageAnimation() constructor{
	#region // Variable Declaration
	// Private //
	
	/// @ignore true
	/// @var {struct} self This transform
	_self = self;
	/// @var {struct} animationTransform The transform that is returned for intermediate animation frames.
	_animationTransform = new visageTransform();
	/// @var {boolean} played If this animation's play() method has been called since creation or being reset.
	_played = false;
	/// @var {boolean} paused If this animation is paused
	_paused = false;
	/// @var {boolean} finished If this animation has reached the end since creation or being reset.
	_finished = false;
	/// @var {real} delay The delay before all curveTimings begin (in ms, never negative)
	_delay = 0;
	
	// Public //
	
	///@ignore false
	/// @var {struct} startTransform The animation's starting transform.
	startTransform = new visageTransform();
	/// @var {struct} endTransform The animation's ending transform.
	endTransform = new visageTransform();	
	/// @var {struct} curveTimings A structure that holds curveTimings in the same format as a transform.
	curveTimings = {
		translation: {
			x: new visageCurveTiming(),
			y: new visageCurveTiming()
		}, 
		rotation: new visageCurveTiming(),
		scale: {
			x: new visageCurveTiming(),
			y: new visageCurveTiming()	
		},
		alpha: new visageCurveTiming()
	};
	#endregion
	
	/// @ignore true
	#region /// @method _isPlaying()
	/// @desc Returns if animation is playing.
	/// @returns {boolean} True if any animation channel is still playing false if not.
	_isPlaying = function(){
		var _isPlaying = false;
		_isPlaying = _isPlaying || curveTimings.translation.x.isPlaying();
		_isPlaying = _isPlaying || curveTimings.translation.y.isPlaying();
		_isPlaying = _isPlaying || curveTimings.rotation.isPlaying();
		_isPlaying = _isPlaying || curveTimings.scale.x.isPlaying();
		_isPlaying = _isPlaying || curveTimings.scale.y.isPlaying();
		_isPlaying = _isPlaying || curveTimings.alpha.isPlaying();
		return _isPlaying;
	}
	#endregion
	
	/// @ignore false
	#region /// @method copy(animation)
	/// @desc Copies data from provided animation to this one.
	/// @param {struct} animation The animation to copy data from.
	/// @returns {struct} This animation for method chaining.
	copy = function(_animation){
		startTransform.copy(_animation.startTransform);
		endTransform.copy(_animation.endTransform);
		curveTimings.translation.x.copy(_animation.curveTimings.translation.x);
		curveTimings.translation.y.copy(_animation.curveTimings.translation.y);
		curveTimings.rotation.copy(_animation.curveTimings.rotation);
		curveTimings.scale.x.copy(_animation.curveTimings.scale.x);
		curveTimings.scale.y.copy(_animation.curveTimings.scale.y);
		curveTimings.alpha.copy(_animation.curveTimings.alpha);
		return _self;
	}#endregion
	
	#region /// @method started()
	/// @desc Returns if animation has been started.
	/// @returns {boolean} True if started false if not.
	started = function(){
		return _played;	
	}#endregion
	
	#region /// @method isPaused()
	/// @desc Returns if animation is paused.
	/// @returns {boolean} True if paused false if not.
	isPaused = function(){
		return _paused;
	}
	#endregion
	
	#region /// @method isFinished()
	/// @desc Returns if animation is finished.
	/// @returns {boolean} True if finished false if not.
	isFinished = function(){
		return _finished;
	}
	#endregion
	
	#region /// @method setDelay(delay)
	/// @Desc Sets the main delay that will be applied to all curveTimings in the .play() method.
	/// @param delay The main delay to be set.
	/// @returns {struct} This animation for method chaining.
	setDelay = function(_delay){
		_self._delay = _delay;	
	}
	#endregion
	
	#region /// @method play([delay])
	/// @desc Starts all animation channels for this animation.
	/// @param {real} delay (Optional) If provided and >= 1, overrides this animation set delay.
	/// @returns {null}
	play = function(_delay = 0){
		if (_delay <= 0){
			_delay = _self._delay;
		}
		_played = true;
		_paused = false;
		curveTimings.translation.x.play(_delay);
		curveTimings.translation.y.play(_delay);
		curveTimings.rotation.play(_delay);
		curveTimings.scale.x.play(_delay);
		curveTimings.scale.y.play(_delay);
		curveTimings.alpha.play(_delay);
	}#endregion

	#region /// @method pause()
	/// @desc Pauses animation, maintaining progress.
	/// @returns {null}
	pause = function(){
		_paused = true;
		curveTimings.translation.x.pause();
		curveTimings.translation.y.pause();
		curveTimings.rotation.pause();
		curveTimings.scale.x.pause();
		curveTimings.scale.y.pause();
		curveTimings.alpha.pause();
	}#endregion
	
	#region /// @method resume()
	/// @desc Resumes this animation if it was previously paused.
	/// @returns {null}
	resume = function(){
		_paused = false;
		curveTimings.translation.x.resume();
		curveTimings.translation.y.resume();
		curveTimings.rotation.resume();
		curveTimings.scale.x.resume();
		curveTimings.scale.y.resume();
		curveTimings.alpha.resume();
	}#endregion

	#region /// @method stop([finish])
	/// @desc Stops animation, and resets progress.
	/// @param {boolean} finish (Optional: default = false) If true, the animation will snap to the ending transform, otherwise it stops in place.
	/// @returns {null}
	stop = function(_finish = false){
		curveTimings.translation.x.stop();
		curveTimings.translation.y.stop();
		curveTimings.rotation.stop();
		curveTimings.scale.x.stop();
		curveTimings.scale.y.stop();
		curveTimings.alpha.stop();
		
		if (_finish){
			_animationTransform.copy(endTransform);
		}
	}#endregion
	
	#region /// @method reset()
	/// @desc Stops animation, and resets progress. 
	/// @returns {null}
	reset = function(){
		_played = false;
		_paused = false;
		_finished = false;
		curveTimings.translation.x.reset();
		curveTimings.translation.y.reset();
		curveTimings.rotation.reset();
		curveTimings.scale.x.reset();
		curveTimings.scale.y.reset();
		curveTimings.alpha.reset();
	}#endregion
	
	#region /// @method getTransform()
	/// @desc Gets the current transform based on animation channel progress.
	/// @returns {struct} Transform with current animation values.
	getTransform = function(){
		if (_isPlaying()){
			_animationTransform.translation.x = startTransform.translation.x + 
				((endTransform.translation.x - startTransform.translation.x) * 
					curveTimings.translation.x.getPosition()
				);
			
			_animationTransform.translation.y = startTransform.translation.y + 
				((endTransform.translation.y - startTransform.translation.y) * 
					curveTimings.translation.y.getPosition()
				);
			
			_animationTransform.rotation = startTransform.rotation + 
				((endTransform.rotation - startTransform.rotation) * 
					curveTimings.rotation.getPosition()
				);
		
			_animationTransform.scale.x = startTransform.scale.x + 
				((endTransform.scale.x - startTransform.scale.x) * 
					curveTimings.scale.x.getPosition()
				);
			
			_animationTransform.scale.y = startTransform.scale.y + 
				((endTransform.scale.y - startTransform.scale.y) * 
					curveTimings.scale.y.getPosition()
				);
			
			_animationTransform.alpha = startTransform.alpha + 
				((endTransform.alpha - startTransform.alpha) * 
					curveTimings.alpha.getPosition()
				);
			
			_animationTransform.translation.x = round(_animationTransform.translation.x);
			_animationTransform.translation.y = round(_animationTransform.translation.y);
		}else{
			if (!_paused && _played){
				_animationTransform.copy(endTransform);
				_finished = true;
			}
		}
		return _animationTransform;
	}#endregion
}#endregion
