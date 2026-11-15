extends StaticBody2D




func Player_Visible(body: Node2D) -> void:
	if body is Player :
		body.z_index = 6


func PlayerHide(body: Node2D) -> void:
	if body is Player :
		body.z_index = 0
