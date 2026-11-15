extends Area2D

signal EndGame

func in_area(body : Node2D):
	if body is Player:
		EndGame.emit()
