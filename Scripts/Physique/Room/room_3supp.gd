extends SupportRoom

@onready var walls : Node2D = $Wall

func allumer() -> void :
	walls.show()
	torches.show()

func eteindre() -> void :
	walls.hide()
	torches.hide()
