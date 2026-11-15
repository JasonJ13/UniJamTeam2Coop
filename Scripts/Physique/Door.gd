extends StaticBody2D
class_name Door

@onready var soundEffect : AudioStreamPlayer2D = $doorOpens

func play_sound_and_delete() -> void :
	soundEffect.play()
	await soundEffect.finished
	queue_free()
