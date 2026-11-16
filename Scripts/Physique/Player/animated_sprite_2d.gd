extends AnimatedSprite2D
var is_dragging = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_dragging:
		followMouse()
func followMouse():
	position = get_global_mouse_position()

func _on_area_2d_input_event(_viewport, event,_shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			offset = position - get_global_mouse_position()
			is_dragging = true
		else:
			is_dragging = false
