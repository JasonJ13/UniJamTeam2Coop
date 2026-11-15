extends Control
class_name Menu_help
signal play

@onready var menu_help : Sprite2D =$MenuHelp
@onready var mainMenu : Sprite2D = $MainMenu



func jouer():
	play.emit()

func Help():
	mainMenu.hide()
	menu_help.show()


func initialisation() -> void:
	mainMenu.show()
	menu_help.hide()
