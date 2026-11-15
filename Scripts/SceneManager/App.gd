extends Node

@onready var physical : Node2D = $Game
@onready var spirit : Control = $GameSpirit
@onready var menu : Control = $MainMenu

func play_physical() :
	physical.show()
	menu.hide()

func play_spirit() : 
	spirit.show()
	menu.hide()

func back_menu() :
	spirit.hide()
	physical.hide()
	menu.show()
