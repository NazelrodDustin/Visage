# Utilites
## **Enums**
 ### VISAGE_ALIGNMENT
|  |
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

## `visageTransform()` (*constructor*)

**Variables**

| Name | Datatype  | Purpose |
|--------|-----------|---------|
|`translation` |struct |(x, y) position of transform |




|`rotation` |real |rotation angle (in degrees) of transform |

|`scale` |struct |(x, y) scale of transform |




|`alpha` |struct |alpha of items in this transform |




**Methods**
### `.copy(transform)` → *struct*
Copies data from provided transform to this one.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`transform` |struct |The transform to copy data from. |

**Returns:** This transform for method chaining.

### `.translate(x, y)` → *struct*
Updates transform's translation component by provided (x, y) values.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`x` |real |The change in x translation. |
|`y` |real |The change in y translation. |

**Returns:** This transform for method chaining.

### `.rotate(angle)` → *struct*
Updates transform's rotation component by provided angle value.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`angle` |real |The change in rotation. |

**Returns:** This transform for method chaining.

### `.setTranslation(x, y)` → *struct*
Sets transform's translation component to provided (x, y) values.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`x` |real |The x value to set. |
|`y` |real |The y value to set. |

**Returns:** This transform for method chaining.

### `.setTranslationX(x)` → *struct*
Sets transform's translation x component to provided value.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`x` |real |The x value to set. |

**Returns:** This transform for method chaining.

### `.setTranslationY(y)` → *struct*
Sets transform's translation y component to provided value.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`y` |real |The y value to set. |

**Returns:** This transform for method chaining.

### `.setRotation(angle)` → *struct*
Sets transform's rotation component to provided angle value.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`angle` |real |The angle value to set |

**Returns:** This transform for method chaining.

### `.setScale(x, y)` → *struct*
Sets transform's scale component to provided (x, y) values.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`x` |real |The x value to set. |
|`y` |real |The y value to set. |

**Returns:** This transform for method chaining.

### `.setScaleX(x)` → *struct*
Sets transform's scale x component to provided value.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`x` |real |The x value to set. |

**Returns:** This transform for method chaining.

### `.setScaleY(y)` → *struct*
Sets transform's scale y component to provided value.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`y` |real |The y value to set. |

**Returns:** This transform for method chaining.

### `.setAlpha(alpha)` → *struct*
Sets transform's alpha component to provided value.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`alpha` |real |The alpha value to set |

**Returns:** This transform for method chaining.

### `.toString()` → *string*
formats this transform as a beautified string.

## `visageCurveTiming()` (*constructor*)

**Methods**
### `.copy(curveTiming)` → *struct*
Copies data from provided curveTiming to this one.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`curveTiming` |struct |The curveTiming to copy data from. |

**Returns:** This curveTiming for method chaining.

### `.setCurve(curve)` → *struct*
Sets the animation curve.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`curve` |Asset.GMAnimCurve |The curve to set. |

**Returns:** This curveTiming for method chaining.

### `.setReversed(reversed)` → *struct*
Sets if the animation curve is reversed.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`reversed` |boolean |True if reversed, or false if not. |

**Returns:** This curveTiming for method chaining.

### `.setDelay(delay)` → *struct*
Sets the delay of this curveTiming.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`delay` |real |Time (in ms) to wait before starting animation. >= 0 |

**Returns:** This curveTiming for method chaining.

### `.setDelay(duration)` → *struct*
Sets the duration of this curveTiming.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`duration` |real |Time (in ms) animation will take to finish after any delay. >= 1 |

**Returns:** This curveTiming for method chaining.

### `.getPosition()` → *real*
Gets the position of this curveTiming's curve at the current progress.

**Returns:** The value on the curve at the current progress.

### `.isPlaying()` → *boolean*
Returns if the curveTiming is playing.

**Returns:** True if playing, False if not.

### `.play(delay)` → *null*
Begins the curveTiming's animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`delay` |real |The time (in ms) to delay in addition to this curveTiming's individual delay. |

### `.pause()` → *null*
Pauses the curveTiming's animation.

### `.resume()` → *null*
Resumes the curveTiming's animation.

### `.stop()` → *null*
Stops and resets the curveTiming's animation.

### `.stop()` → *null*
Resets the curveTiming's animation.

## `visageAnimation()` (*constructor*)

| Name | Datatype  | Purpose |
|--------|-----------|---------|
|`startTransform` |struct |The animation's starting transform. |

|`endTransform` |struct |The animation's ending transform. |

|`curveTimings` |struct |A structure that holds curveTimings in the same format as a transform. |



























**Methods**
### `.copy(animation)` → *struct*
Copies data from provided animation to this one.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`animation` |struct |The animation to copy data from. |

**Returns:** This animation for method chaining.

### `.started()` → *boolean*
Returns if animation has been started.

**Returns:** True if started false if not.

### `.isPaused()` → *boolean*
Returns if animation is paused.

**Returns:** True if paused false if not.

### `.isFinished()` → *boolean*
Returns if animation is finished.

**Returns:** True if finished false if not.

### `.setDelay(delay)` → *struct*

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`The` |elay |main delay to be set. |

**Returns:** This animation for method chaining.

### `.play([delay])` → *null*
Starts all animation channels for this animation.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`delay` |real |(Optional) If provided and >= 1, overrides this animation set delay. |

### `.pause()` → *null*
Pauses animation, maintaining progress.

### `.resume()` → *null*
Resumes this animation if it was previously paused.

### `.stop([finish])` → *null*
Stops animation, and resets progress.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`finish` |boolean |(Optional: default = false) If true, the animation will snap to the ending transform, otherwise it stops in place. |

### `.reset()` → *null*
Stops animation, and resets progress.

### `.getTransform()` → *struct*
Gets the current transform based on animation channel progress.

**Returns:** Transform with current animation values.
