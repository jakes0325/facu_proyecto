extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	self.grab_focus()
	$PanelContainer/MarginContainer/BoxContainer2/BtnPlay

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_pressed():
	get_tree().paused = false
	
	print("JUGAR")
	GameManager.play_again()

func _on_button_2_pressed():
	get_tree().paused = false
		
	print("SALIR")
	GameManager.back_to_menu()
