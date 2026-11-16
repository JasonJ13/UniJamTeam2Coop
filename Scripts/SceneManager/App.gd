extends Node

@onready var menu : Control = $Selection
@onready var main_menu : Control = $MainMenu
@onready var title_screen : Control = $"Title screen"
@onready var musicManager : MusicManager = $MusicManager

var gameSceneRessource = preload("res://Physique/GamePhys.tscn")
var espritSceneRessource = preload("res://Esprit/GameSpirit.tscn")

var gamePhysic : GamePhysic
var gameEsprit : GameSpirit

func play_physical() :
	musicManager.Play("Room1&2")
	menu.hide()
	gamePhysic = gameSceneRessource.instantiate()
	
	gamePhysic.play1.connect(PlayRoom1)
	gamePhysic.play3.connect(PlayRoom3)
	gamePhysic.play5.connect(PlayRoom5)
	
	add_child(gamePhysic)

func play_spirit() : 
	musicManager.Play("Esprit")
	menu.hide()
	gameEsprit = espritSceneRessource.instantiate()
	
	gameEsprit.creditPlay.connect(PlayMenu)
	
	add_child(gameEsprit)

func back_menu() :
	musicManager.Play("Menu")
	menu.hide()
	main_menu.hide()
	title_screen.show()

func select_menu():
	title_screen.hide()
	main_menu.hide()
	menu.show()

func go_to_main_menu():
	title_screen.hide()
	main_menu.show()
	main_menu.initialisation()

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if Input.is_action_pressed("Menu"):
		if (gameEsprit != null) :
			gameEsprit.queue_free()
			back_menu()
		
		if (gamePhysic != null) :
			gamePhysic.queue_free()
			back_menu()

func PlayMenu() -> void :
	musicManager.Play("Menu")

func PlayRoom1() -> void :
	musicManager.Play("Room1&2")

func PlayRoom3() -> void :
	musicManager.Play("Room3&4")

func PlayRoom5() -> void :
	musicManager.Play("Room5")
