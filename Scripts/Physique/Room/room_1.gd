extends Room


func _on_room_retour() -> void:
	retour.emit()
	
func _on_room_sorti() -> void:
	sorti.emit()
