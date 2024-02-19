# Containers
Containers are the base for any GUI element. Can control visibility, location, rotation, and scale for an entire group of GUI elements. The container is not a visible element, see window for a visible element with similar properties. <br>

## `visage_container_create(config)` → *struct*
Creates a new container based off a configuration profile.

**Returns:** Container configuration profile. This is a test change.

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
|`animationCurve` |Asset.GMAnimCurve |The animation curve to set in the container. |
|`isReversed` |bool |Determines if the animation curve is read normally (false) or reversed (true) |

## `visage_container_set_entrance_movement_timing(container, duration, offset)` → *void*
Sets the movement animation duration and offset for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the movement duration in. |
|`duration` |real |The animation duration (in ms) to set in the container. |
|`offset` |real |The starting offset (in ms) of the animation. |

## `visage_container_set_entrance_movement_position_start(container, startX, startY)` → *void*
Sets the starting movement position for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the starting movement position in. |
|`startX` |real |The animation starting x position to set in the container. |
|`startY` |real |The animation starting y position to set in the container. |

## `visage_container_set_entrance_movement_position_end(container, endX, endY)` → *void*
Sets the ending movement position for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the ending movement position in. |
|`endX` |real |The animation ending x position to set in the container. |
|`endY` |real |The animation ending y position to set in the container. |

## `visage_container_set_entrance_rotation_animation(container, animationCurve, isReversed)` → *void*
Sets the rotation animation curve for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the rotation animation in. |
|`animationCurve` |Asset.GMAnimCurve |The animation curve to set in the container. |
|`isReversed` |bool |Determines if the animation curve is read normally (false) or reversed (true) |

## `visage_container_set_entrance_rotation_timing(container, duration, offset)` → *void*
Sets the rotation animation duration and offset for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the rotation duration in. |
|`duration` |real |The animation duration (in ms) to set in the container. |
|`offset` |real |The starting offset (in ms) of the animation. |

## `visage_container_set_entrance_rotation_start(container, startAngle)` → *void*
Sets the starting rotation angle for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the starting rotation angle in. |
|`startAngle` |real |The animation starting rotation angle to set in the container. |

## `visage_container_set_entrance_rotation_end(container, endAngle)` → *void*
Sets the ending rotation angle for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the ending rotation angle in. |
|`endAngle` |real |The animation ending rotation angle to set in the container. |

## `visage_container_set_entrance_scale_animation(container, animationCurve, isReversed)` → *void*
Sets the scale animation curve for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the scale animation in. |
|`animationCurve` |Asset.GMAnimCurve |The animation curve to set in the container. |
|`isReversed` |bool |Determines if the animation curve is read normally (false) or reversed (true) |

## `visage_container_set_entrance_scale_timing(container, duration, offset)` → *void*
Sets the scale animation duration and offset for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the scale duration in. |
|`duration` |real |The animation duration (in ms) to set in the container. |
|`offset` |real |The starting offset (in ms) of the animation. |

## `visage_container_set_entrance_scale_start(container, startScale)` → *void*
Sets the starting scale for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the starting scale in. |
|`startScale` |real |The animation starting scale to set in the container. |

## `visage_container_set_entrance_scale_end(container, endScale)` → *void*
Sets the ending scale for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the ending scale in. |
|`endScale` |real |The animation ending scale to set in the container. |

## `visage_container_set_entrance_alpha_animation(container, animationCurve, isReversed)` → *void*
Sets the alpha animation curve for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the scale animation in. |
|`animationCurve` |Asset.GMAnimCurve |The animation curve to set in the container. |
|`isReversed` |bool |Determines if the animation curve is read normally (false) or reversed (true) |

## `visage_container_set_entrance_alpha_timing(container, duration, offset)` → *void*
Sets the alpha animation duration and offset for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the alpha duration in. |
|`duration` |real |The animation duration (in ms) to set in the container. |
|`offset` |real |The starting offset (in ms) of the animation. |

## `visage_container_set_entrance_alpha_start(container, startAlpha)` → *void*
Sets the starting alpha for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the starting alpha in. |
|`startAlpha` |real |The animation starting alpha to set in the container. |

## `visage_container_set_entrance_alpha_end(container, endAlpha)` → *void*
Sets the starting alpha for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the ending alpha in. |
|`endAlpha` |real |The animation ending alpha to set in the container. |

## `visage_container_set_exit_movement_animation(container, animationCurve, isReversed)` → *void*
Sets the movement animation curve for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the movement animation in. |
|`animationCurve` |Asset.GMAnimCurve |The animation curve to set in the container. |
|`isReversed` |bool |Determines if the animation curve is read normally (false) or reversed (true) |

## `visage_container_set_exit_movement_timing(container, duration, offset)` → *void*
Sets the movement animation duration and offset for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the movement duration in. |
|`duration` |real |The animation duration (in ms) to set in the container. |
|`offset` |real |The starting offset (in ms) of the animation. |

## `visage_container_set_exit_movement_position_start(container, startX, startY)` → *void*
Sets the starting movement position for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the starting movement position in. |
|`startX` |real |The animation starting x position to set in the container. |
|`startY` |real |The animation starting y position to set in the container. |

## `visage_container_set_exit_movement_position_end(container, endX, endY)` → *void*
Sets the ending movement position for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the ending movement position in. |
|`endX` |real |The animation ending x position to set in the container. |
|`endY` |real |The animation ending y position to set in the container. |

## `visage_container_set_exit_rotation_animation(container, animationCurve, isReversed)` → *void*
Sets the rotation animation curve for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the rotation animation in. |
|`animationCurve` |Asset.GMAnimCurve |The animation curve to set in the container. |
|`isReversed` |bool |Determines if the animation curve is read normally (false) or reversed (true) |

## `visage_container_set_exit_rotation_timing(container, duration, offset)` → *void*
Sets the rotation animation duration and offset for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the rotation duration in. |
|`duration` |real |The animation duration (in ms) to set in the container. |
|`offset` |real |The starting offset (in ms) of the animation. |

## `visage_container_set_exit_rotation_start(container, startAngle)` → *void*
Sets the starting rotation angle for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the starting rotation angle in. |
|`startAngle` |real |The animation starting rotation angle to set in the container. |

## `visage_container_set_exit_rotation_end(container, endAngle)` → *void*
Sets the ending rotation angle for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the ending rotation angle in. |
|`endAngle` |real |The animation ending rotation angle to set in the container. |

## `visage_container_set_exit_scale_animation(container, animationCurve, isReversed)` → *void*
Sets the scale animation curve for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the scale animation in. |
|`animationCurve` |Asset.GMAnimCurve |The animation curve to set in the container. |
|`isReversed` |bool |Determines if the animation curve is read normally (false) or reversed (true) |

## `visage_container_set_exit_scale_timing(container, duration, offset)` → *void*
Sets the scale animation duration and offset for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the scale duration in. |
|`duration` |real |The animation duration (in ms) to set in the container. |
|`offset` |real |The starting offset (in ms) of the animation. |

## `visage_container_set_exit_scale_start(container, startScale)` → *void*
Sets the starting scale for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the starting scale in. |
|`startScale` |real |The animation starting scale to set in the container. |

## `visage_container_set_exit_scale_end(container, endScale)` → *void*
Sets the ending scale for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the ending scale in. |
|`endScale` |real |The animation ending scale to set in the container. |

## `visage_container_set_exit_alpha_animation(container, animationCurve, isReversed)` → *void*
Sets the alpha animation curve for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the scale animation in. |
|`animationCurve` |Asset.GMAnimCurve |The animation curve to set in the container. |
|`isReversed` |bool |Determines if the animation curve is read normally (false) or reversed (true) |

## `visage_container_set_exit_alpha_timing(container, duration, offset)` → *void*
Sets the alpha animation duration and offset for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the alpha duration in. |
|`duration` |real |The animation duration (in ms) to set in the container. |
|`offset` |real |The starting offset (in ms) of the animation. |

## `visage_container_set_exit_alpha_start(container, startAlpha)` → *void*
Sets the starting alpha for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the starting alpha in. |
|`startAlpha` |real |The animation starting alpha to set in the container. |

## `visage_container_set_exit_alpha_end(container, endAlpha)` → *void*
Sets the starting alpha for specified container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |The container to set the ending alpha in. |
|`endAlpha` |real |The animation ending alpha to set in the container. |
