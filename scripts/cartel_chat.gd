extends Area2D
var player_in_area= false

# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.signal_event.connect(end_chatting)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_in_area:
		if Input.is_action_just_pressed("e") and GameManager.chatting == false:
			run_dialogue("chat_cartel")



func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)
	on_chat()

func _on_body_entered(body):
	if body.is_in_group("player"):
		player_in_area= true

func on_chat() -> void:
	GameManager.chatting = true

func _on_body_exited(body):
	if body.is_in_group("player"):
		player_in_area= false
		
		
func end_chatting(arg: String) -> void:
	if arg == "end_chatting":
		GameManager.chatting = false
