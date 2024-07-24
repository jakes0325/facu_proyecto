extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$PanelContainer/MarginContainer/BoxContainer2/BtnPlayAgain.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_pressed():
	print("VOLVER A JUGAR")
	GameManager.play_again()

func _on_button_2_pressed():
	print("MENU PRINCIPAL")
	GameManager.back_to_menu()
