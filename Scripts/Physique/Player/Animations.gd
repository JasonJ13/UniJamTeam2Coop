extends Node2D
class_name AnimationManager


@onready var animations : AnimationPlayer = $AnimationPlayer

## 0 : stop | 1 : walk | 2 : interact
var anim : int = 0

signal StopInteract

func walking() -> void :
	if anim != 1 :
		animations.play("walk")
		anim = 1

func stop() -> void :
	if anim != 0 :
		animations.play("IDLE")
		anim = 0

func interact() -> void :
	if anim != 2 :
		animations.play("Interaction")
		anim = 2
	
		await animations.animation_finished
		
		StopInteract.emit()
		walking()
