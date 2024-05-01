# Elements
Visage is composed of elements. The methods listed here are shared by all elements.

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
