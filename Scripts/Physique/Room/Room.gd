extends Node2D
class_name Room

@onready var entry : Node2D = $EntrySpawn
@onready var exit : Node2D = $ExitSpawn
@onready var middle : Node2D = $Middle
signal retour
signal sorti



func _on_entree_body_entered(body: Node2D) -> void:
	print("entrer")
	if body is Player:
		retour.emit()


func _on_sortie_body_entered(body: Node2D) -> void:
	print("sortie")
	if body is Player:
		sorti.emit()

func allumer():
	$"../Torches".show()

func eteindre():
	$"../Torches".hide()
