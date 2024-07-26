extends Node

var scene_name: String
var current_scene = "main_menu" #world, forest, house, main_menu, dead_menu
var changed_scene
var new_scene_setted = false
var chatting:bool = false
var dead:bool = false
var boss_killed:bool = false

#Props iniciales
const vida_inicial = 100
const world_start_pos_x = 122
const world_start_pos_y = 155
const house_start_pos_x = 568
const house_start_pos_y = 75
const forest_start_pos_x = 727
const forest_start_pos_y = 319

#----------GAME SCENES----------
# MAIN MENU -> WORLD | EXIT
# WORLD -> HOUSE | FOREST
# HOUSE -> MAIN
# FOREST -> WORLD | DEAD MENU
# DEAD MENU -> WORLD | MAIN MENU

var player_pos_x
var player_pos_y
var game_first_loadin = true
var bosque_mente_first_loadin = true

func start_game() -> void:
	set_new_scene("world")
	player_pos_x = world_start_pos_x
	player_pos_y = world_start_pos_y
	#TODO: RENDERIZAR EL MAPA PRINCIPAL/INICIO DEL JUEGO

func play_again() -> void:
	boss_killed = false
	dead = false
	game_first_loadin = true
	bosque_mente_first_loadin = true
	start_game()
	#TODO: AGREGAR FUNCIONES PARA RECEPCIONAR SEÑAL DE VOLVER A JUGAR

func back_to_menu() -> void:
	set_new_scene("main_menu")
	#TODO: AGREGAR FUNCIONES PARA VOLVER AL MENU PRINCIPAL

func exit_game() -> void:
	get_tree().quit()
	#TODO: AGREGAR FUNCIONES PARA SALIR DEL JUEGO

func set_new_scene(new_scene:String) -> void:
	print("Escena para cambiar-> " + new_scene)
	new_scene_setted = true
	changed_scene = get_tree().current_scene.name
	current_scene = new_scene

func change_scene()-> void:
	get_tree().change_scene_to_file("res://scenes/" + current_scene + ".tscn")
	match current_scene:
		"world":
			match changed_scene:
				"forest":
					player_pos_x = forest_start_pos_x
					player_pos_y = forest_start_pos_y
				"house":
					player_pos_x = house_start_pos_x
					player_pos_y = house_start_pos_y
		"forest":
			player_pos_x = forest_start_pos_x
			player_pos_y = forest_start_pos_y
		"house":
			player_pos_x = house_start_pos_x
			player_pos_y = house_start_pos_y

	new_scene_setted = false



