extends SupportRoom

@onready var walls : Node2D = $Wall
@onready var symbol : Node2D = $Symbol

func allumer() -> void :
	walls.show()
	torches.show()
	symbol.show()

func eteindre() -> void :
	walls.hide()
	torches.hide()
	symbol.hide()
