extends SupportRoom



signal SwitchLight
func emitLight() -> void:
	SwitchLight.emit()
	$Torches.visible = !$Torches.visible

signal Win

func win():
	Win.emit()
