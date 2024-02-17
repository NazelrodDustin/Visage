# Containers
Containers are the base for any GUI element. Can control visibility, location, rotation, and scale for an entire group of GUI elements. The container is not a visible element, see window for a visible element with similar properties. <br>
## Member variables <br>
 | Name                    | Type    | Description                                |
 |-------------------------|---------|--------------------------------------------|
 | x                       | real    | The center x position of the container     |
 | y                       | real    | The center y position of the container     |
 | rotation                | real    | The rotation (radians) of the container    |
 | scale                   | real    | The scale of the container                 |
 | isVisible               | boolean | Determines if the container is visible     |
 | animationCurveMovement  | struct  | The animation curve that dictates movement |
 | animationMovementLength | real    | The length of the movement animation       |
 | animationCurveRotation  | struct  | The animation curve that dictates rotation |
 | animationRotationLength | real    | The length of the movement animation       |
 | animationCurveScale     | struct  | The animation curve that dictates scale    |
 | animationScaleLength    | real    | The length of the movement animation       |
 | animationCurveAlpha     | struct  | The animation curve that dictates alpha    |
 | animationAlphaLength    | real    | The length of the movement animation       |
## Member methods <br>

## `container` (*constructor*)

**Methods**
### `.` → *struct*

## `visage_create_container(config)` → *void*
Creates a new container based off a configuration profile

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`config` |struct |Container configuration struct. |

**Returns:** Container configuration profile.

### `.` → {rv}

## `visage_destroy_container(container)` → {rv}
Destroys a previously created container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |Container to destroy. |
