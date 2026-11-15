extends Control
class_name RoomSpirit

@export var pieces : Array[Piece] = []
@export var keys: Array[Vector2] = []
var placed : Array[bool]= []

signal prev()
signal next()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(len(pieces)):
		pieces[i].pos_key=keys[i]
		placed.append(false)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in range(len(pieces)):
		if pieces[i].is_placed():
			placed[i]=true
		else:
			placed[i]=false

func all_placed() -> bool:
	var res=true
	for i in range(len(placed)):
		res=res&&placed[i]
	return res

func hide_prev_button():
	$Button3.visible=false

func show_next_button():
	$Button.visible=true

func hide_next_button():
	$Button.visible=false


func _on_button_pressed() -> void:
	next.emit()


func _on_button_3_pressed() -> void:
	prev.emit()
