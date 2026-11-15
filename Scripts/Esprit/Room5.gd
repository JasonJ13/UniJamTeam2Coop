extends Control

class_name Room5

@export var pieces : Array[Piece] = []
@export var keys: Array[Vector2] = []
var placed : Array[bool]= []

signal prev()
signal next()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(len(keys)):
		pieces[i].pos_key=keys[i]
		placed.append(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in range(len(keys)):
		if pieces[i].is_placed():
			placed[i]=true
		else:
			placed[i]=false

func all_placed() -> bool:
	var res=true
	for i in range(len(placed)):
		res=res&&placed[i]
	return res

func _on_button_pressed() -> void:
	next.emit()

func _on_button_3_pressed() -> void:
	prev.emit()
