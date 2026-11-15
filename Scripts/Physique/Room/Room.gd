extends Node2D
class_name Room

@export var entry : Node2D 
@export var exit : Node2D
@export var middle : Node2D 
signal retour
signal sorti

@export var showBase := true
@onready var baseTiles : TileMapLayer = $Base

func _ready() -> void:
	if (showBase && baseTiles != null) :
		baseTiles.show()

func _on_entree_body_entered(body: Node2D) -> void:
	if body is Player:
		retour.emit()


func _on_sortie_body_entered(body: Node2D) -> void:
	if body is Player:
		sorti.emit()

func allumer():
	$"../Torches".show()

func eteindre():
	$"../Torches".hide()
