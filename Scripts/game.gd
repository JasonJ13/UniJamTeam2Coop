extends Node2D
class_name Game

var emplacement = 1

@onready var player : Node2D = $Player
@onready var camera : Camera2D = $Camera2D

@export var rooms : Array[SupportRoom]

@export var isOnDefaultLit = true

func _ready() -> void:
	camera.position = rooms[0].getMiddle()
	for room in rooms :
		room.retour.connect(room_retour)
		room.sorti.connect(room_sorti)

func room_retour() -> void:
	if emplacement == 1 :
		return
	
	emplacement -= 1
	print(emplacement)
	CheckLightRoom()
	player.position = rooms[emplacement-1].getExit()
	camera.position = rooms[emplacement-1].getMiddle()


func room_sorti() -> void:
	if emplacement == rooms.size() :
		return
	
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
