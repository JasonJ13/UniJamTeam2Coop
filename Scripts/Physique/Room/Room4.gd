extends Room

signal WinTheGame

var answer_door = [3, 2, 2, 4, 3, 2, 3, 1]
var answer_game = [1, 2, 4, 1, 3, 4, 2, 1]

var index = 0

var current_list = 0

var opened = false

@onready var door = $HiddenWall
@onready var button : PhysiqueButton = $buttonA

@export var defaultLit = false

func GetButton(id : int) -> void:
	button.play_sound() # bouton A, possède cette fonction
	if id == answer_door[index] && (current_list == 0 || current_list == 1):
		current_list = 1
		index += 1
		if index == answer_door.size() && opened == false:
			door.play_sound()
			door.visible = false
			opened = true
	elif id == answer_game[index] && (current_list == 0 || current_list == 2):
		current_list = 2
		index += 1
		if index == answer_game.size():
			door.play_sound() # à implémenter sur la porte secrète
			#shake camera
			WinTheGame.emit()
	else:
		index = 0
		current_list = 0
