extends CharacterBody2D
var chatting :bool = false
var player_in_area= false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_in_area:
		if Input.is_action_just_pressed("e") and chatting == false:
			run_dialogue("PrimeraMision")
			chatting == true
			

func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)
	
	
func _on_chat_detection_body_entered(body):
	if body.has_method("player"):
		player_in_area= true


func _on_chat_detection_body_exited(body):
	if body.has_method("player"):
		player_in_area= false
