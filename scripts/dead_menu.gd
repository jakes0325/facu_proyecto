extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	self.grab_focus()
	$PanelContainer/MarginContainer/BoxContainer2/BtnPlay

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GameManager.new_scene_setted:
		GameManager.change_scene()

func _on_button_pressed():
	print("JUGAR DE NUEVO")
	GameManager.play_again()

func _on_button_2_pressed():
	print("MENU PRINCIPAL")
	GameManager.back_to_menu()
