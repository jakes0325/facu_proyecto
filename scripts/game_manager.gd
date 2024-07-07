
extends Node
var scene_name: String
var current_sceen = "world" #world cliff-side forest
var transition_scenes = false
var chatting:bool = false

#var player_exit_house_posx = 568
#var player_exit_house_posy = 69
#
#var player_exit_forest_posx = 727
#var player_exit_forest_posy = 319

var player_start_posx = 122  # house.x = 568  --  forest.x = 727
var player_start_posy = 155  # house.y = 69   --  forest.y = 319

var game_first_loadin = true


func finish_changescene() -> void:
	if transition_scenes == true: #este if creo q esta demas
		transition_scenes = false
		if scene_name == "casa_cama":
			current_sceen = "house"
		elif scene_name == "main":
			current_sceen = "world"
		elif scene_name == "bosque_mente":
			current_sceen = "forest"
 


