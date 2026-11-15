extends Node

@onready var physical : Node2D = $Game
@onready var spirit : Control = $GameSpirit
@onready var menu : Control = $Selection
@onready var main_menu : Control = $MainMenu


func play_physical() :
	physical.show()
	menu.hide()

func play_spirit() : 
	spirit.show()
	menu.hide()

func back_menu() :
	spirit.hide()
	physical.hide()
	menu.hide()
	main_menu.show()

func select_menu():
	main_menu.hide()
	menu.show()
