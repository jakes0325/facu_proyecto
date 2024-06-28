extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_scene()



func _on_scene_trigger_body_entered(body):
	if body.is_in_group("player"):
		GameManager.transition_scenes = true
		
		
func change_scene() -> void:
	if GameManager.transition_scenes == true:
		if GameManager.current_sceen == "world":
			get_tree().change_scene_to_file("res://scenes/casa_cama.tscn")
			GameManager.finish_changescene()

