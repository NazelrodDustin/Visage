///@title Visage Utilites
///@category Misc

if (VISAGE_AUTO_INIT){
	global._visageInitTimeSource = time_source_create(time_source_global, 1, time_source_units_frames, _visageInit, [], 1);

	function _visageInit(){
		instance_create_depth(0, 0, 0, _visageController);	
	}

	time_source_start(global._visageInitTimeSource);	
}

/// @text ## VISAGE_ALIGNMENT

/// @text | Value |
/// @text |---|
/// @text | TOP_LEFT |
/// @text | TOP_CENTER |
/// @text | TOP_RIGHT |
/// @text | MIDDLE_LEFT |
/// @text | MIDDLE_CENTER |
/// @text | MIDDLE_RIGHT |
/// @text | BOTTOM_LEFT |
/// @text | BOTTOM_CENTER |
/// @text | BOTTOM_RIGHT |
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

#region /// @function _visageIncreme_visagePrioritySortntSort(element1, element2)
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

function visageTransform() constructor{
	_self = self;
	
	translation = {
		x: 0,
		y: 0
	};
	rotation =  0;
	scale = {
		x: 1,
		y: 1
	};
	alpha = 1;
	
	
	copy = function(_transform){
		translation.x = _transform.translation.x;
		translation.y = _transform.translation.y;
		rotation = _transform.rotation;
		scale.x = _transform.scale.x;
		scale.x = _transform.scale.x;
		alpha.x = _transform.alpha.x;
		return _self;
	}
	
	translate = function(_x, _y){
		translation.x += _x;
		translation.y += _y;
		return _self;
	}
	
	rotate = function(_angle){
		rotation += _angle;
		return _self;
	}
	
	setTranslation = function(_x, _y){
		translation.x = _x;
		translation.y = _y;
		return _self;
	}
	
	setTranslationX = function(_x){
		translation.x = _x;
		return _self;
	}
	
	setTranslationY = function(_y){
		translation.y = _y;	
		return _self;
	}
	
	setRotation = function(_angle){
		rotation = _angle;
		return _self;
	}
	
	setScale = function(_x, _y){
		scale.x = _x;
		scale.y = _y;
		return _self;
	}
	
	setScaleX = function(_x){
		scale.x = _x;
		return _self;
	}
	
	setScaleY = function(_y){
		scale.y = _y;
		return _self;
	}
	
	setAlpha = function(_alpha){
		alpha = _alpha;
		return _self;
	}
}

function visageCurveTiming() constructor{
	_curve = linear;
	_reversed = false;
	_playing = false;
	_progress = 0; // %
	_duration = 1; //In ms, never less than 1.
	_delay = 0; //In ms, never negative.
	_elapsedTime = 0; //In ms.
	
	setCurve = function(curve){
		_curve = curve;
		return _self;
	}
	
	setReversed = function(reversed){
		_reversed = reversed;
		return _self;
	}
	
	setDelay = function(delay){
		_delay = delay;
		if (_delay < 0){
			_delay = 0;	
		}
		return _self;
	}
	
	setDuration = function(duration){
		_duration = duration;
		if (_duration < 1){
			_duration = 1;	
		}
		return _self;
	}
	
	getCurve = function(){
		return _curve;
	}
	
	isPlaying = function(){
		return _playing;	
	}
	
	getProgress = function(){
		if (_playing){ 
			
			_elapsedTime += visageDeltaTime();
			progress = clamp(max(_elapsedTime - _delay, 0) / _duration, 0, 1);
		
		
			if (progress >= 1){
				stop();
			}
		}
		
		return _reversed ? 1 - _progress : _progress;	
	}
	
	play = function(delay){
		_playing = true;
	}
	
	pause = function(){
		_playing = false;
	}
	
	stop = function(){
		_playing = false;
		reset();
	}
	
	reset = function(){
		_elapsedTime = 0;	
	}
}

/// @constructor
/// @func visageAnimation()
function visageAnimation() constructor{
	_animationTransform = new visageTransform();
	_paused = false;
	
	startTransform = new visageTransform();
	endTransform = new visageTransform();
	
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
		
	delay = 0; //In ms
	
	#region /// @method isPlaying()
	/// @desc Returns if animation is playing.
	/// @returns {boolean} True if any animation channel is still playing false if not.
	isPlaying = function(){
		var _isPlaying = false;
		_isPlaying = _isPlaying || curveTimings.translation.x.isPlaying();
		_isPlaying = _isPlaying || curveTimings.translation.y.isPlaying();
		_isPlaying = _isPlaying || curveTimings.rotation.isPlaying();
		_isPlaying = _isPlaying || curveTimings.translation.x.isPlaying();
		_isPlaying = _isPlaying || curveTimings.translation.y.isPlaying();
		_isPlaying = _isPlaying || curveTimings.alpha.isPlaying();
		return _isPlaying();
	}
	#endregion
	
	#region /// @method isPaused()
	/// @desc Returns if animation is paused.
	/// @returns {boolean} True if paused false if not.
	isPaused = function(){
		return _paused;
	}
	#endregion
	
	#region /// @method play()
	/// @desc Starts all animation channels for this animation.
	/// @returns {null}
	play = function(){
		_paused = false;
		curveTimings.translation.x.play(delay);
		curveTimings.translation.y.play(delay);
		curveTimings.rotation.play(delay);
		curveTimings.translation.x.play(delay);
		curveTimings.translation.y.play(delay);
		curveTimings.alpha.play(delay);
	}
	#endregion

	#region /// @method pause()
	/// @desc Pauses animation, maintaining progress.
	/// @returns {null}
	pause = function(){
		_paused = true;
		curveTimings.translation.x.pause();
		curveTimings.translation.y.pause();
		curveTimings.rotation.pause();
		curveTimings.translation.x.pause();
		curveTimings.translation.y.pause();
		curveTimings.alpha.pause();
	}
	#endregion

	#region /// @method stop([finish])
	/// @desc Stops animation, and resets progress.
	/// @param finish {boolean} (Optional: default = false) If true, the animation will snap to the ending transform, otherwise it stops in place.
	/// @returns {null}
	stop = function(_finish = false){
		curveTimings.translation.x.stop();
		curveTimings.translation.y.stop();
		curveTimings.rotation.stop();
		curveTimings.translation.x.stop();
		curveTimings.translation.y.stop();
		curveTimings.alpha.stop();
		
		if (_finish){
			_animationTransform.copy(endTransform);
		}
	}
	#endregion
	
	#region /// @method reset()
	/// @desc Stops animation, and resets progress. 
	/// @returns {null}
	reset = function(_finish = false){
		curveTimings.translation.x.reset();
		curveTimings.translation.y.reset();
		curveTimings.rotation.reset();
		curveTimings.translation.x.reset();
		curveTimings.translation.y.reset();
		curveTimings.alpha.reset();
	}
	#endregion
	
	#region /// @method getTransform()
	/// @desc Gets the current transform based on animation channel progress.
	/// @returns {struct} Transform with current animation values.
	getTransform = function(){
		_animationTransform.translation.x = startTransform.translation.x + 
			((endTransform.translation.x - startTransform.translation.x) * 
				animcurve_channel_evaluate(
					animcurve_get_channel(
						curveTimings.translation.x.getCurve(), 0
					), 
					curveTimings.translation.x.getProgress()
				)
			);
			
		_animationTransform.translation.y = startTransform.translation.y + 
			((endTransform.translation.y - startTransform.translation.y) * 
				animcurve_channel_evaluate(
					animcurve_get_channel(
						curveTimings.translation.y.getCurve(), 0
					), 
					curveTimings.translation.y.getProgress()
				)
			);
			
		_animationTransform.rotation = startTransform.rotation + 
			((endTransform.rotation - startTransform.rotation) * 
				animcurve_channel_evaluate(
					animcurve_get_channel(
						curveTimings.rotation.getCurve(), 0
					), 
					curveTimings.rotation.getProgress()
				)
			);
		
		_animationTransform.scale.x = startTransform.scale.x + 
			((endTransform.scale.x - startTransform.scale.x) * 
				animcurve_channel_evaluate(
					animcurve_get_channel(
						curveTimings.scale.x.getCurve(), 0
					), 
					curveTimings.scale.x.getProgress()
				)
			);
			
		_animationTransform.scale.y = startTransform.scale.y + 
			((endTransform.scale.y - startTransform.scale.y) * 
				animcurve_channel_evaluate(
					animcurve_get_channel(
						curveTimings.scale.y.getCurve(), 0
					), 
					curveTimings.scale.y.getProgress()
				)
			);
			
		_animationTransform.alpha = startTransform.alpha + 
			((endTransform.alpha - startTransform.alpha) * 
				animcurve_channel_evaluate(
					animcurve_get_channel(
						curveTimings.alpha.getCurve(), 0
					), 
					curveTimings.alpha.getProgress()
				)
			);
			
		_animationTransform.translation.x = round(_animationTransform.translation.x);
		_animationTransform.translation.y = round(_animationTransform.translation.y);		
			
		return _animationTransform;
	}
	#endregion
}