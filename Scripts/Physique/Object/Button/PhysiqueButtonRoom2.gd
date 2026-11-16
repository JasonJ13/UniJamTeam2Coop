extends PhysiqueButton

var times_pressed = 0

@onready var countdown : Timer = $Timer


func press() :
	play_sound()
	if countdown.is_stopped() == false:
		countdown.stop()
	times_pressed += 1
	
	countdown.start(1)

func _on_timeout():
	if times_pressed == 4:
		pressed.emit(0)
	else:
		times_pressed = 0
