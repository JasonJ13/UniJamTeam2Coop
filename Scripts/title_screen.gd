extends Control

signal signalmenu



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if Input.is_action_pressed("Title_screen") && visible:
		signalmenu.emit()

func go_to_main_menu():
	signalmenu.emit()
