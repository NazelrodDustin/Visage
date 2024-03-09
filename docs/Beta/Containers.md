# Containers
Containers are the base for any GUI element. Can control visibility, location, rotation, and scale for an entire group of GUI elements. The container is not a visible element, see window for a visible element with similar properties. <br>

## `visageContainer()` (*constructor*)

**Methods**
### `._update()` → *null*
[Internal] Frame update logic for animations and other data. This is called internally and should not be called manually.

### `.getElementSize()` → *null*
Drawing logic for this element to be called in _draw()

### `.drawElement()` → *null*
Draw this element to be called in _draw()

### `.setVisibility(visible)` → *null*
Sets the visibility of the container

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`visible` |bool |If the container is visible or not. |

### `.getVisibility(visible)` → *bool*
Gets the visibility of the container

### `.animationEntrancePlay(forced)` → *bool*
starts playing the exit animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`forced` |bool |Determines if the animation is forced to play or not. |

**Returns:** True if the animation was started, False if not.

### `.animationEntranceIsPlaying()` → *bool*
Checks if entrance animation is currently playing.

**Returns:** True if the animation is currently playing, False if not.

### `.animationEntranceReset()` → *null*
Resets exit animation to beginning and stops playing.

### `.animationExitPlay(forced)` → *bool*
starts playing the exit animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`forced` |bool |Determines if the animation is forced to play or not. |

**Returns:** True if the animation was started, False if not.

### `.animationExitIsPlaying()` → *bool*
Checks if exit animation is currently playing.

**Returns:** True if the animation is currently playing, False if not.

### `.animationExitReset()` → *null*
Resets exit animation to beginning and stops playing.

### `.setEntranceAnimationOffset(offset)` → *struct*
Sets exit animation offset. This adds an offset to all entrance animation channels, for use when container is a child to another container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`offset` |real |The offset (in ms) to delay the entire entrance animation. |

**Returns:** This container for method chaining.

### `.setExitAnimationOffset(offset)` → *struct*
Sets exit animation offset. This adds an offset to all exit animation channels, for use when container is a child to another container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`offset` |real |The offset (in ms) to delay the entire exit animation. |

**Returns:** This container for method chaining.

### `.setEntranceAnimationMovementCurve(animationCurve, isReversed)` → *struct*
Sets the movement animation curve for the entrance animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`animationCurve` |Asset.GMAnimCurve |The animation curve to set in the container. |
|`isReversed` |bool |Determines if the animation curve is read normally (false) or reversed (true) |

**Returns:** This container for method chaining.

### `.setEntranceAnimationMovementTiming(duration, offset)` → *struct*
Sets the movement animation duration and offset for the entrance animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`duration` |real |The animation duration (in ms) to set in the container. |
|`offset` |real |The starting offset (in ms) of the animation. |

**Returns:** This container for method chaining.

### `.setEntranceAnimationMovementPositionStart(startX, startY)` → *struct*
Sets the starting movement position for the entrance animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`startX` |real |The animation starting x position to set in the container. |
|`startY` |real |The animation starting y position to set in the container. |

**Returns:** This container for method chaining.

### `.setEntranceAnimationMovementPositionEnd(endX, endY)` → *struct*
Sets the ending movement position for the entrance animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`endX` |real |The animation ending x position to set in the container. |
|`endY` |real |The animation ending y position to set in the container. |

**Returns:** This container for method chaining.

### `.setExitAnimationMovementCurve(animationCurve, isReversed)` → *struct*
Sets the movement animation curve for the exit animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`animationCurve` |Asset.GMAnimCurve |The animation curve to set in the container. |
|`isReversed` |bool |Determines if the animation curve is read normally (false) or reversed (true) |

**Returns:** This container for method chaining.

### `.setExitAnimationMovementTiming(duration, offset)` → *struct*
Sets the movement animation duration and offset for the exit animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`duration` |real |The animation duration (in ms) to set in the container. |
|`offset` |real |The starting offset (in ms) of the animation. |

**Returns:** This container for method chaining.

### `.setExitAnimationMovementPositionStart(startX, startY)` → *struct*
Sets the starting movement position for the exit animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`startX` |real |The animation starting x position to set in the container. |
|`startY` |real |The animation starting y position to set in the container. |

**Returns:** This container for method chaining.

### `.setExitAnimationMovementPositionEnd(endX, endY)` → *struct*
Sets the ending movement position for the exit animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`endX` |real |The animation ending x position to set in the container. |
|`endY` |real |The animation ending y position to set in the container. |

**Returns:** This container for method chaining.

### `.setEntranceAnimationRotationCurve(animationCurve, isReversed)` → *struct*
Sets the rotation animation curve for the entrance animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`animationCurve` |Asset.GMAnimCurve |The animation curve to set in the container. |
|`isReversed` |bool |Determines if the animation curve is read normally (false) or reversed (true) |

**Returns:** This container for method chaining.

### `.setEntranceAnimationRotationTiming(duration, offset)` → *struct*
Sets the rotation animation duration and offset for the entrance animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`duration` |real |The animation duration (in ms) to set in the container. |
|`offset` |real |The starting offset (in ms) of the animation. |

**Returns:** This container for method chaining.

### `.setEntranceAnimationRotationStart(startAngle)` → *struct*
Sets the starting rotation angle for the entrance animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`startAngle` |real |The animation starting rotation angle to set in the container. |

**Returns:** This container for method chaining.

### `.setEntranceAnimationRotationEnd(endAngle)` → *struct*
Sets the ending rotation angle for the entrance animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`endAngle` |real |The animation ending rotation angle to set in the container. |

**Returns:** This container for method chaining.

### `.setExitAnimationRotationCurve(animationCurve, isReversed)` → *struct*
Sets the rotation animation curve for the exit animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`animationCurve` |Asset.GMAnimCurve |The animation curve to set in the container. |
|`isReversed` |bool |Determines if the animation curve is read normally (false) or reversed (true) |

**Returns:** This container for method chaining.

### `.setExitAnimationRotationTiming(duration, offset)` → *struct*
Sets the rotation animation duration and offset for the exit animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`duration` |real |The animation duration (in ms) to set in the container. |
|`offset` |real |The starting offset (in ms) of the animation. |

**Returns:** This container for method chaining.

### `.setExitAnimationRotationStart(startAngle)` → *struct*
Sets the starting rotation angle for the exit animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`startAngle` |real |The animation starting rotation angle to set in the container. |

**Returns:** This container for method chaining.

### `.setExitAnimationRotationEnd(endAngle)` → *struct*
Sets the ending rotation angle for the exit animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`endAngle` |real |The animation ending rotation angle to set in the container. |

**Returns:** This container for method chaining.

### `.setEntranceAnimationScaleCurve(animationCurve, isReversed)` → *struct*
Sets the scale animation curve for the entrance animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`animationCurve` |Asset.GMAnimCurve |The animation curve to set in the container. |
|`isReversed` |bool |Determines if the animation curve is read normally (false) or reversed (true) |

**Returns:** This container for method chaining.

### `.setEntranceAnimationScaleTiming(duration, offset)` → *struct*
Sets the scale animation duration and offset for the entrance animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`duration` |real |The animation duration (in ms) to set in the container. |
|`offset` |real |The starting offset (in ms) of the animation. |

**Returns:** This container for method chaining.

### `.setEntranceAnimationScaleStart(startScale)` → *struct*
Sets the starting scale for the entrance animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`startScale` |real |The animation starting scale to set in the container. |

**Returns:** This container for method chaining.

### `.setEntranceAnimationScaleEnd(endScale)` → *struct*
Sets the ending scale for the entrance animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`endScale` |real |The animation ending scale to set in the container. |

**Returns:** This container for method chaining.

### `.setExitAnimationScaleCurve(animationCurve, isReversed)` → *struct*
Sets the scale animation curve for the exit animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`animationCurve` |Asset.GMAnimCurve |The animation curve to set in the container. |
|`isReversed` |bool |Determines if the animation curve is read normally (false) or reversed (true) |

**Returns:** This container for method chaining.

### `.setExitAnimationScaleTiming(duration, offset)` → *struct*
Sets the scale animation duration and offset for the exit animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`duration` |real |The animation duration (in ms) to set in the container. |
|`offset` |real |The starting offset (in ms) of the animation. |

**Returns:** This container for method chaining.

### `.setExitAnimationScaleStart(startScale)` → *struct*
Sets the starting scale for the exit animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`startScale` |real |The animation starting scale to set in the container. |

**Returns:** This container for method chaining.

### `.setExitAnimationScaleEnd(endScale)` → *struct*
Sets the ending scale for the exit animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`endScale` |real |The animation ending scale to set in the container. |

**Returns:** This container for method chaining.

### `.setEntranceAnimationAlphaCurve(animationCurve, isReversed)` → *struct*
Sets the alpha animation curve for the entrance animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`animationCurve` |Asset.GMAnimCurve |The animation curve to set in the container. |
|`isReversed` |bool |Determines if the animation curve is read normally (false) or reversed (true) |

**Returns:** This container for method chaining.

### `.setEntranceAnimationAlphaTiming(duration, offset)` → *struct*
Sets the alpha animation duration and offset for the entrance animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`duration` |real |The animation duration (in ms) to set in the container. |
|`offset` |real |The starting offset (in ms) of the animation. |

**Returns:** This container for method chaining.

### `.setEntranceAnimationAlphaStart(startAlpha)` → *struct*
Sets the starting alpha for the entrance animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`startAlpha` |real |The animation starting alpha to set in the container. |

**Returns:** This container for method chaining.

### `.setEntranceAnimationAlphaEnd(endAlpha)` → *struct*
Sets the starting alpha for the entrance animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`endAlpha` |real |The animation ending alpha to set in the container. |

**Returns:** This container for method chaining.

### `.setExitAnimationAlphaCurve(animationCurve, isReversed)` → *struct*
Sets the alpha animation curve for the exit animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`animationCurve` |Asset.GMAnimCurve |The animation curve to set in the container. |
|`isReversed` |bool |Determines if the animation curve is read normally (false) or reversed (true) |

**Returns:** This container for method chaining.

### `.setExitAnimationAlphaTiming(duration, offset)` → *struct*
Sets the alpha animation duration and offset for the exit animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`duration` |real |The animation duration (in ms) to set in the container. |
|`offset` |real |The starting offset (in ms) of the animation. |

**Returns:** This container for method chaining.

### `.setExitAnimationAlphaStart(startAlpha)` → *struct*
Sets the starting alpha for the exit animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`startAlpha` |real |The animation starting alpha to set in the container. |

**Returns:** This container for method chaining.

### `.setExitAnimationAlphaEnd(endAlpha)` → *struct*
Sets the starting alpha for the exit animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`endAlpha` |real |The animation ending alpha to set in the container. |

**Returns:** This container for method chaining.
