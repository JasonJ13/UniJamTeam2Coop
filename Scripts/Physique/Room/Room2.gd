extends Room

var locked = true

@onready var door : Door = $Door

@export var defaultLit = true

@warning_ignore("unused_parameter")
func GetButton(id : int) -> void:
	if locked:
		door.play_sound_and_delete()
		locked = false
