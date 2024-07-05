
extends Node

var current_sceen = "world" #world cliff-side
var transition_scenes = false
var chatting:bool = false

var player_exit_cliffside_posx = 568
var player_exit_cliffside_posy = 69
var player_start_posx = 122
var player_start_posy = 155

var game_first_loadin = true


func finish_changescene() -> void:
	if transition_scenes == true: #este if creo q esta demas
		transition_scenes = false
		if current_sceen == "world":
			current_sceen = "house"
		else:
			current_sceen = "world"
 


