# Containers
Containers are the base for any GUI element. Can control visibility, location, rotation, and scale for an entire group of GUI elements. The container is not a visible element, see window for a visible element with similar properties. <br>

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

## `visage_container_set_entrance_movement_animation(container, animationCurve, isReversed)` → *void*
Sets the movement animation curve for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the movement animation in. |
|`animationCurve` |struct |The animation curve to set in the container. |
|`isReversed` |boolean |Determines if the animation curve is read normally (false) or reversed (true) |

## `visage_container_set_entrance_movement_timing(container, duration, offset)` → *void*
Sets the movement animation duration for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the movement duration in. |
|`duration` |real |The animation duration to set in the container. |
|`offset` |real |The starting offset of the animation. |

## `visage_container_set_entrance_movement_position_start(container, startX, startY)` → *void*
Sets the movement starting position for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the movement starting position in. |
|`startX` |real |The animation starting x position to set in the container. |
|`startY` |real |The animation starting y position to set in the container. |

## `visage_container_set_entrance_movement_position_end(container, endX, endY)` → *void*
Sets the movement ending position for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the movement ending position in. |
|`endX` |real |The animation ending x position to set in the container. |
|`endY` |real |The animation ending y position to set in the container. |

## `visage_container_set_exit_movement_animation(container, animationCurve, isReversed)` → *void*
Sets the movement animation curve for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the movement animation in. |
|`animationCurve` |struct |The animation curve to set in the container. |
|`isReversed` |boolean |Determines if the animation curve is read normally (false) or reversed (true) |

## `visage_container_set_exit_movement_timing(container, duration, offset)` → *void*
Sets the movement animation duration for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the movement duration in. |
|`duration` |real |The animation duration to set in the container. |
|`offset` |real |The starting offset of the animation. |

## `visage_container_set_exit_movement_position_start(container, startX, startY)` → *void*
Sets the movement starting position for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the movement starting position in. |
|`startX` |real |The animation starting x position to set in the container. |
|`startY` |real |The animation starting y position to set in the container. |

## `visage_container_set_exit_movement_position_end(container, endX, endY)` → *void*
Sets the movement ending position for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the movement ending position in. |
|`endX` |real |The animation ending x position to set in the container. |
|`endY` |real |The animation ending y position to set in the container. |
