# Visage
Containers are the base for any GUI element. Can control visibility, location, rotation, and scale for an entire group of GUI elements. The container is not a visible element, see window for a visible element with similar properties.

## `visage_create_container(_config)` → *struct*
Creates a new container based off a configuration profile

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`_config` |struct |Container configuration struct. |

**Returns:** Container configuration profile.

## `visage_destroy_container(_container)` → `undefined`
Destroys a previously created container.

| Parameter | Datatype  | Purpose |
|-----------|-----------|---------|
|`_container` |struct |Container to destroy. |

















