extends PhysiqueButton

@export var id : int = 0

func press() :
	play_sound()
	print(id)
	pressed.emit(id)
