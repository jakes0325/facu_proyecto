extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if GameManager.game_first_loadin == true:
		$Player.position.x = GameManager.player_start_posx
		$Player.position.y = GameManager.player_start_posy
	else:
		$Player.position.x = GameManager.player_exit_cliffside_posx
		$Player.position.y = GameManager.player_exit_cliffside_posy


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
			GameManager.game_first_loadin = false
			GameManager.finish_changescene()

