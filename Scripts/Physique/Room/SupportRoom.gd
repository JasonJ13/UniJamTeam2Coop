extends Node2D
class_name SupportRoom

@onready var room : Room = $Room

@onready var torches : Node2D = $Torches
@export var DefaultLit = true

signal sorti
signal retour

func _ready() -> void:
	room.sorti.connect(sorti.emit)
	room.retour.connect(retour.emit)

func getEntry() -> Vector2 :
	return room.entry.position + position

func getExit() -> Vector2 :
	return room.exit.position + position

func getMiddle() -> Vector2 :
	return room.middle.position + position

func allumer() -> void :
	torches.show()

func eteindre() -> void :
	torches.hide()
