extends CharacterBody2D
var player_in_area= false
# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.signal_event.connect(empezar_la_busqueda)
	Dialogic.signal_event.connect(end_chatting)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_in_area:
		if Input.is_action_just_pressed("e") and GameManager.chatting == false:
			run_dialogue("PrimeraMision")
			
			

func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)
	on_chat()
	
func _on_chat_detection_body_entered(body):
	if body.has_method("player"):
		player_in_area= true


func _on_chat_detection_body_exited(body):
	if body.has_method("player"):
		player_in_area= false
		
func on_chat() -> void:
	GameManager.chatting = true
	

func end_chatting(arg: String) -> void:
	if arg == "end_chatting":
		GameManager.chatting = false

func empezar_la_busqueda(arg: String) -> void:
	#if arg == "start_mission":
		#
	pass
	
