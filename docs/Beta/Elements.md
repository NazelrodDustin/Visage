# Elements
Visage is composed of elements. The methods listed here are shared by all elements.

## `visageElement()` (*constructor*)

**Methods**
### `.addAnchorPoint(point)` → *null*
Adds a new point to the anchorPoints array.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`point` |struct |The point to be added. |

### `.getAnchorPoint(index)` → *struct*
Returns the anchor point at provdied index.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`index` |real |The index of the anchor point. Will wrap around if out of bounds. |

**Returns:** the vector2 anchor point.

### `.setAnchorPointIndex(index)` → *null*
Sets this elements anchor point index to use from it's parent element;

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`index` |real |The index to be used. |

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

### `.setPriority(priority)` → *null*
Sets priority of element then increments all element of the same priority or higher.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`priority` |real |The new element priority to set. |
