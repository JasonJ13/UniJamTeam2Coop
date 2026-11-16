extends SupportRoom

func _init() -> void:
	lit = DefaultLit

func _process(_delta: float) -> void:
	if lit && not torchSound.playing:
		torchSound.play()
	elif not lit:
		torchSound.stop()

func allumer() -> void :
	lit = true
	torches.show()
	$SymboleInLight.show()
	$SymboleInDark.hide()

func eteindre() -> void :
	lit = false
	torches.hide()
	$SymboleInLight.hide()
	$SymboleInDark.show()


func _on_pitfall_end_game() -> void:
	pass # Go to end game screen
