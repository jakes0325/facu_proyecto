extends Node2D

#var scene_name: String
#Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _process(delta):
	if GameManager.new_scene_setted:
		GameManager.change_scene()

func _on_scene_trigger_body_entered(body):
	if body.is_in_group("player"):
		GameManager.set_new_scene("world")
		GameManager.game_first_loadin = false
