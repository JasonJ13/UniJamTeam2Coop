extends Node2D
class_name GamePhysic

signal quit
var emplacement = 1

@onready var player : Node2D = $Player
@onready var camera : Camera2D = $Camera2D

@export var rooms : Array[SupportRoom]

@export var isOnDefaultLit = true

signal play1
signal play3
signal play5

func _ready() -> void:
	camera.position = rooms[0].getMiddle()
	for room in rooms :
		room.retour.connect(room_retour)
		room.sorti.connect(room_sorti)

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if Input.is_action_pressed("Menu"):
		quit.emit()

func room_retour() -> void:
	if emplacement == 1 :
		return
	elif emplacement == 3 :
		play1.emit()
	elif emplacement == 5 :
		play3.emit()
	
	emplacement -= 1
	print(emplacement)
	CheckLightRoom()
	player.position = rooms[emplacement-1].getExit()
	camera.position = rooms[emplacement-1].getMiddle()


func room_sorti() -> void:
	if emplacement == rooms.size() :
		return
	elif emplacement == 2 :
		play3.emit()
	elif emplacement == 4 :
		play5.emit()
	
	emplacement += 1
	print(emplacement)
	CheckLightRoom()
	player.position = rooms[emplacement-1].getEntry()
	camera.position = rooms[emplacement-1].getMiddle()


func CheckLightRoom() -> void :
	if isOnDefaultLit == rooms[emplacement-1].DefaultLit :
		rooms[emplacement-1].allumer()
	else :
		rooms[emplacement-1].eteindre()


func switchLight() -> void:
	isOnDefaultLit = !isOnDefaultLit

func win() ->void :
	camera.position=$Node2D.position
	player.hide()
