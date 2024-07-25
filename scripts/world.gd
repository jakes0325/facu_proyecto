extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.signal_event.connect(end_chatting)
	if GameManager.game_first_loadin == true:
		Dialogic.start("Introduccion")
		GameManager.chatting = true

	$Player.position.x = GameManager.player_pos_x
	$Player.position.y = GameManager.player_pos_y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if GameManager.new_scene_setted:
		change_scene()

func _on_scene_trigger_body_entered(body):
	if body.is_in_group("player"):
		GameManager.set_new_scene("house")
				
func change_scene() -> void:
	if GameManager.new_scene_setted:
		GameManager.change_scene()

func end_chatting(arg: String) -> void:
	if arg == "end_chatting":
		GameManager.chatting = false

func _on_scene_trigger_forest_body_entered(body):
	if body.is_in_group("player"):
		GameManager.set_new_scene("forest")
