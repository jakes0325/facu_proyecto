extends Node2D


@onready var enemy = $enemy

#var scene_name: String
# Called when the node enters the scene tree for the first time.
func _ready():
	enemy.end.connect(_on_enemy_end)
	Dialogic.signal_event.connect(end_chatting)
	if GameManager.bosque_mente_first_loadin == true:
		Dialogic.start("Introduccion_Bosque_Mente")
		GameManager.chatting = true
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GameManager.new_scene_setted:
		GameManager.change_scene()

func _on_scene_trigger_body_entered(body):
	if body.is_in_group("player"):
		GameManager.set_new_scene("world")
		GameManager.game_first_loadin = false

func end_chatting(arg: String) -> void:
	if arg == "end_chatting":
		GameManager.chatting = false
		GameManager.bosque_mente_first_loadin = false


func _on_enemy_end():
	if GameManager.dead != true:
		Dialogic.start("mensaje_final")
		GameManager.chatting = true
		GameManager.boss_killed = true
