# Visage Utilites
## VISAGE_ALIGNMENT
| Value |
|---|
| TOP_LEFT |
| TOP_CENTER |
| TOP_RIGHT |
| MIDDLE_LEFT |
| MIDDLE_CENTER |
| MIDDLE_RIGHT |
| BOTTOM_LEFT |
| BOTTOM_CENTER |
| BOTTOM_RIGHT |

## `visageInitialized()` → *bool*
Returns if Visage is initialized.

**Returns:** True if Visage is initialized, False otherwise.

## `visageTrackElement(element)` → *null*
Adds element to be tracked by system.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`{struct}` |lement |The element to be tracked. |

## `visageRemoveTrackedElement(element)` → *null*
Removes element from being tracked by system.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`{struct}` |lement |The element to be removed. |

## `visageDeltaTime()` → *real*
Gets the time since last frame.

**Returns:** Time since last frame.

## `visageAnimation()` (*constructor*)

**Methods**
### `.isPlaying()` → *boolean*
Returns if animation is playing.

**Returns:** True if any animation channel is still playing false if not.

### `.isPaused()` → *boolean*
Returns if animation is paused.

**Returns:** True if paused false if not.

### `.play()` → *null*
Starts all animation channels for this animation.

### `.pause()` → *null*
Pauses animation, maintaining progress.

### `.stop([finish])` → *null*
Stops animation, and resets progress.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`{boolean}` |inish |(Optional: default = false) If true, the animation will snap to the ending transform, otherwise it stops in place. |

### `.reset()` → *null*
Stops animation, and resets progress.

### `.getTransform()` → *struct*
Gets the current transform based on animation channel progress.

**Returns:** Transform with current animation values.
