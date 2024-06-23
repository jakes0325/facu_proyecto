extends Node

var player: CharacterBody2D
var scenes_path : String = "res://scenes/"


func change_scene(from, to_scene_name : String) -> void:
	player = from.player
	player.get_parent().remove_child(player)
	var fullpath = scenes_path + to_scene_name + "tscn"
	from.get_tree().call_deferred("change_scene_to_file", fullpath)


