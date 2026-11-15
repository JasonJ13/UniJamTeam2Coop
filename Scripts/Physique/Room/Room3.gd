extends Room



@onready var door : Door = $door
@onready var buttonDoor : PhysiqueButton = $buttonDoor


@warning_ignore("unused_parameter")
func _open_door(id : int) -> void:
	door.queue_free()
	buttonDoor.queue_free()
