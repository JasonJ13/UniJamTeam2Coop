extends SupportRoom


func allumer() -> void :
	torches.show()
	$SymboleInLight.show()
	$SymboleInDark.hide()

func eteindre() -> void :
	torches.hide()
	$SymboleInLight.hide()
	$SymboleInDark.show()
