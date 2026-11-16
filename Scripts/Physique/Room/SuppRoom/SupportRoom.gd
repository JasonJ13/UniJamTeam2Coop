extends Node2D
class_name SupportRoom

@onready var room : Room = $Room

@onready var torches : Node2D = $Torches
@onready var torchSound : AudioStreamPlayer2D = $torchSound
@export var DefaultLit = true

var lit = true

signal sorti
signal retour

func _ready() -> void:
	room.sorti.connect(sorti.emit)
	room.retour.connect(retour.emit)

func _process(_delta: float) -> void:
	if lit && not torchSound.playing:
		torchSound.play()
	elif not lit:
		torchSound.stop()

func getEntry() -> Vector2 :
	return room.entry.position + position

func getExit() -> Vector2 :
	return room.exit.position + position

func getMiddle() -> Vector2 :
	return room.middle.position + position

func allumer() -> void :
	lit = true
	torches.show()

func eteindre() -> void :
	lit = false
	torches.hide()
