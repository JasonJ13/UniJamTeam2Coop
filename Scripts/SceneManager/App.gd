extends Node

@onready var menu : Control = $Selection
@onready var main_menu : Control = $MainMenu
@onready var title_screen : Control = $"Title screen"
@onready var musicManager : MusicManager = $MusicManager

var gameSceneRessource = preload("res://Scenes/Physique/Game.tscn")
var espritSceneRessource = preload("res://Scenes/Esprit/GameSpirit.tscn")

var gamePhysic : Node2D
var gameEsprit : Control

func play_physical() :
	musicManager.PlayPhysic()
	menu.hide()
	gamePhysic = gameSceneRessource.instantiate()
	add_child(gamePhysic)

func play_spirit() : 
	musicManager.PlayEsprit()
	menu.hide()
	gameEsprit = espritSceneRessource.instantiate()
	add_child(gameEsprit)

func back_menu() :
	musicManager.PlayMenu()
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

func _process(delta: float) -> void:
	if Input.is_action_pressed("Menu"):
		if (gameEsprit != null) :
			gameEsprit.queue_free()
			back_menu()
		
		if (gamePhysic != null) :
			gamePhysic.queue_free()
			back_menu()
		
