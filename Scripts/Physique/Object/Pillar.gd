extends StaticBody2D




func Player_Visible(body: Node2D) -> void:
	if body is Player :
		body.ChangeVisibillity(false)


func PlayerHide(body: Node2D) -> void:
	if body is Player :
		body.ChangeVisibillity()
