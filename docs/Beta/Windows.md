# Windows
Similar to a Container, the window contains a group of GUI elements. The window has potential of being moved, resized, closed, minimized, and restored. Each of these features can be configured as enabled or disabled. Resizing a window will not change the scale of elements inside of the window, but may allow other elements to expand or contract if elements are configured to behave in as such.

## `visage_create_window(_config)` → *struct*
Creates a new window based off a configuration profile

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`_config` |struct |Window configuration Profile. |

**Returns:** Window configuration profile.

## `visage_destroy_window(_window)` → *void*
Destroys a previously created window.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`_window` |struct |Window to destroy. |
