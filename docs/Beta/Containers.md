# Containers
Containers are the base for any GUI element. Can control visibility, location, rotation, and scale for an entire group of GUI elements. The container is not a visible element, see window for a visible element with similar properties. <br>
## Member variables <br>
 | Name      | Type    | Description                             |
 |-----------|---------|-----------------------------------------|
 | x         | real    | The x position of the container         |
 | y         | real    | The y position of the container         |
 | rotation  | real    | The rotation (radians) of the container |
 | scale     | real    | The scale of the container              |
 | isVisible | boolean | Determines if the container is visible  |

## `visage_create_container(config)` → *struct*
Creates a new container based off a configuration profile

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`config` |struct |Container configuration struct. |

**Returns:** Container configuration profile.

## `visage_destroy_container(container)` → *void*
Destroys a previously created container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`container` |struct |Container to destroy. |
