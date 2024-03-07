# Windows
Similar to a Container, the Window contains a group of GUI elements. The Window has potential of being moved, resized, closed, minimized, and restored. Each of these features can be configured as enabled or disabled. Resizing a window will not change the scale of elements inside of the window, but may allow other elements to expand or contract if elements are configured to behave as such.<br>

## `visageWindow()` (*constructor*)

**Methods**
### `.drawElement()` → *null*
Drawing logic for this element to be called in _draw()

### `.addSubElement(element)` → *null*
Adds a sub element to be tracked by this element.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`element` |struct |The element to add to be tracked. |

### `.removeSubElement(element)` → *null*
Removes a sub element from being tracked by this element.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`element` |struct |The element to remove from being tracked. |
