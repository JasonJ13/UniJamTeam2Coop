extends PhysiqueButton


# Called when the node enters the scene tree for the first time.
func press() :
	pressed.emit(1)
