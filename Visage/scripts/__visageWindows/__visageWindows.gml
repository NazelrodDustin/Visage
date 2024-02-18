/// @title Windows
/// @category Documentation
window = function(_config) constructor{
	
	
	xx = _config.xx;
	yy = _config.yy;
	rotation = _config.rotation;
	scale = _config.scale;
	isVisible = _config.isVisible;
	
	subElements = []
}

/// @text Similar to a Container, the window contains a group of GUI elements. The window has potential of being moved, resized, closed, minimized, and restored. Each of these features can be configured as enabled or disabled. Resizing a window will not change the scale of elements inside of the window, but may allow other elements to expand or contract if elements are configured to behave in as such.

/// @func visage_create_window(_config)
/// @desc Creates a new window based off a configuration profile
/// @param {struct} _config Window configuration Profile.
/// @returns {struct} Window configuration profile.
function visage_create_window(_config){
	return new window(_config);
}


/// @func visage_destroy_window(_window)
/// @desc Destroys a previously created window.
/// @param {struct} _window Window to destroy.
/// @returns {void}
function visage_destroy_window(_container){
	delete _container;
}

