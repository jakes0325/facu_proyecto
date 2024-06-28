
extends Node

var current_sceen = "world" #world cliff-side
var transition_scenes = false

var player_exit_cliffside_posx = 0
var player_exit_cliffside_posy = 0
var player_start_posx = 0
var player_start_posy = 0


func finish_changescene() -> void:
	if transition_scenes == true: #este if creo q esta demas
		transition_scenes = false
		if current_sceen == "world":
			current_sceen = "cliff_side"
		else:
			current_sceen = "world"
 


