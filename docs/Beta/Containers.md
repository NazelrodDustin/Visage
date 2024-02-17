# Containers
Containers are the base for any GUI element. Can control visibility, location, rotation, and scale for an entire group of GUI elements. The container is not a visible element, see window for a visible element with similar properties. <br>
## Member variables <br>
 | Name                      | Type    | Description                                |
 |---------------------------|---------|--------------------------------------------|
 | x                         | real    | The center x position of the container     |
 | y                         | real    | The center y position of the container     |
 | rotation                  | real    | The rotation (radians) of the container    |
 | scale                     | real    | The scale of the container                 |
 | isVisible                 | boolean | Determines if the container is visible     |
 | animationCurveMovement    | struct  | The animation curve that dictates movement |
 | animationMovementDuration | real    | The Duration of the movement animation     |
 | animationStartX           | real    | The starting center x position             |
 | animationStartY           | real    | The starting center y position             |
 | animationEndX             | real    | The ending center x position               |
 | animationEndY             | real    | The ending center y position               |
 | animationCurveRotation    | struct  | The animation curve that dictates rotation |
 | animationRotationDuration | real    | The Duration of the movement animation     |
 | animationStartRotation    | real    | The starting rotation amount               |
 | animationEndRotation		| real    | The ending rotation amount                 |
 | animationCurveScale       | struct  | The animation curve that dictates scale    |
 | animationScaleDuration    | real    | The Duration of the movement animation     |
 | animationStartScale	    | real    | The starting scale amount                  |
 | animationEndScale			| real    | The ending scale amount                    |
 | animationCurveAlpha       | struct  | The animation curve that dictates alpha    |
 | animationAlphaDuration    | real    | The Duration of the movement animation     |
 | animationStartAlpha	    | real    | The starting alpha value                   |
 | animationEndAlpha 		| real    | The ending alpha value                     |
## Member methods <br>

## `visage_container_create(config)` → *struct*
Creates a new container based off a configuration profile.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`config` |struct |Container configuration struct. |

**Returns:** Container configuration profile.

## `visage_container_destroy(container)` → *void*
Destroys a previously created container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |Container to destroy. |

## `visage_container_set_movement_animation(container, animationCurve)` → *void*
Sets the movement animation curve for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the movement animation in. |
|`animationCurve` |struct |The animation curve to set in the container. |

## `visage_container_set_movement_duration(container, duration)` → *void*
Sets the movement animation duration for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the movement duration in. |
|`duration` |real |The animation duration to set in the container. |

## `visage_container_set_movement_position_start(container, startX, startY)` → *void*
Sets the movement starting position for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the movement starting position in. |
|`startX` |real |The animation starting x position to set in the container. |
|`startY` |real |The animation starting y position to set in the container. |

## `visage_container_set_movement_position_end(container, endX, endY)` → *void*
Sets the movement ending position for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the movement ending position in. |
|`endX` |real |The animation ending x position to set in the container. |
|`endY` |real |The animation ending y position to set in the container. |
