extends Control
class_name Menu_help
signal play

@onready var menu_help : Sprite2D =$MenuHelp
@onready var mainMenu : Sprite2D = $MainMenu

var on_help=false

func jouer():
	play.emit()

func Help():
	mainMenu.hide()
	menu_help.show()
	on_help=true

func _process(delta: float) -> void:
	if Input.is_action_pressed("Title_screen") && visible && on_help:
		on_help=false
		menu_help.hide()
		mainMenu.show()

func initialisation() -> void:
	on_help=false
	mainMenu.show()
	menu_help.hide()
