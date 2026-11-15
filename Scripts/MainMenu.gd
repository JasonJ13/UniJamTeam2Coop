extends Control
class_name MainMenu

signal physicPlay
signal espritPlay
signal quit

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if Input.is_action_pressed("Menu"):
		quit.emit()


func _on_selection_esprit_choose() -> void:
	espritPlay.emit()


func _on_selection_physique_choose() -> void:
	physicPlay.emit()
