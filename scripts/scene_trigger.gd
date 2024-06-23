extends Area2D

var connected_sceme: String
var scenes_folder = "res://scenes/"


func _on_body_entered(body):
	if body.is_in_group("player"):
		GameManager.change_scene(get_owner(), connected_sceme)
	
