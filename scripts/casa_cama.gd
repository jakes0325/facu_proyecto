extends Node2D

#var scene_name: String
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
	
func _process(delta):
	change_scene()


func change_scene() -> void:
	if GameManager.transition_scenes == true:
		if GameManager.current_sceen == "house":
			get_tree().change_scene_to_file("res://scenes/"+GameManager.scene_name+".tscn")
			GameManager.player_start_posx = 568
			GameManager.player_start_posy = 71
			GameManager.finish_changescene()


func _on_scene_trigger_body_entered(body):
	if body.is_in_group("player"):
		GameManager.transition_scenes = true
		GameManager.scene_name = "main"
