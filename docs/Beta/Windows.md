# Containers
Containers are the base for any GUI element. Can control visibility, location, rotation, and scale for an entire group of GUI elements. The container is not a visible element, see window for a visible element with similar properties.

## `visage_create_container(_config)` → *struct*
Creates a new container based off a configuration profile

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`_config` |struct |Container configuration struct. |

**Returns:** Container configuration profile.

## `visage_destroy_container(_container)` → `undefined`
Destroys a previously created container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`_container` |struct |Container to destroy. |





# Windows












Similar to a Container, the window contains a group of GUI elements. The window has potential of being moved, resized, closed, minimized, and restored. Each of these features can be configured as enabled or disabled. Resizing a window will not change the scale of elements inside of the window, but may allow other elements to expand or contract if elements are configured to behave in as such.

## `visage_create_window(_config)` → *struct*
Creates a new window based off a configuration profile

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`_config` |struct |Window configuration Profile. |

**Returns:** Window configuration profile.

## `visage_destroy_window(_window)` → `undefined`
Destroys a previously created window.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`_window` |struct |Window to destroy. |




