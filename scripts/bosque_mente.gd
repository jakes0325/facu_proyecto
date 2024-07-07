extends Node2D

#var scene_name: String
# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.signal_event.connect(end_chatting)
	if GameManager.bosque_mente_first_loadin == true:
		Dialogic.start("Introduccion_Bosque_Mente")
		GameManager.chatting = true
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_scene()


func change_scene() -> void:
	if GameManager.transition_scenes == true:
		if GameManager.current_sceen == "forest":
			get_tree().change_scene_to_file("res://scenes/"+GameManager.scene_name+".tscn")
			GameManager.player_start_posx = 727
			GameManager.player_start_posy = 319
			GameManager.finish_changescene()


func _on_scene_trigger_body_entered(body):
	if body.is_in_group("player"):
		GameManager.transition_scenes = true
		GameManager.scene_name = "main"

func end_chatting(arg: String) -> void:
	if arg == "end_chatting":
		GameManager.chatting = false
		GameManager.bosque_mente_first_loadin = false


func _on_enemy_end():
	Dialogic.start("mensaje_final")
	GameManager.chatting = true
	GameManager.boss_killed = true
