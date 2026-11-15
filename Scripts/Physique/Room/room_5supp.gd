extends SupportRoom


func allumer() -> void :
	torches.show()
	$SymboleInLight.show()
	$SymboleInDark.hide()

func eteindre() -> void :
	torches.hide()
	$SymboleInLight.hide()
	$SymboleInDark.show()


func _on_pitfall_end_game() -> void:
	pass # Go to end game screen
