extends CharacterBody2D

var current_dir: String = "down"
var  SPEED:int = 150

@onready var debug = $debug
@onready var progress_bar = $ProgressBar

var health:int = 100:
	set(value):
		health = value
		progress_bar.value = value


func _ready():
	$AnimatedSprite2D.play("front_idle")
	$debug.set_visible(false)

func _physics_process(delta):
	player_movement(delta)
	if health <= 0:
		died()

func player_movement(delta) -> void:
	if GameManager.chatting == false:
		if Input.is_action_pressed("ui_right"):
			current_dir = "right"
			play_anim(1)
			velocity.x = SPEED
			velocity.y = 0
		elif Input.is_action_pressed("ui_left"):
			current_dir = "left"
			play_anim(1)
			velocity.x = -SPEED
			velocity.y = 0
		elif Input.is_action_pressed("ui_down"):
			current_dir = "down"
			play_anim(1)
			velocity.y = SPEED
			velocity.x = 0
		elif Input.is_action_pressed("ui_up"):
			current_dir = "up"
			play_anim(1)
			velocity.y = -SPEED
			velocity.x = 0
		else:
			play_anim(0)
			velocity.y = 0
			velocity.x = 0
		move_and_slide()

func play_anim(movement) -> void:
	var dir = current_dir
	var anim = $AnimatedSprite2D
	match dir:
		"right":
			anim.flip_h = false
			if movement == 1:
				anim.play("side_walk")
			elif movement == 0:
				anim.play("side_idle")
		"left":
			anim.flip_h = true
			if movement == 1:
				anim.play("side_walk")
			elif movement == 0:
				anim.play("side_idle")
		"down":
			anim.flip_h = true
			if movement == 1:
				anim.play("front_walk")
			elif movement == 0:
				anim.play("front_idle")
		"up":
			anim.flip_h = true
			if movement == 1:
				anim.play("back_walk")
			elif movement == 0:
				anim.play("back_idle")


func set_status(bullet_type):
		match bullet_type:
			0:
				fire()
			1:
				poison()
			2:
				slow()
			3:
				stun()

func player():
	pass

func fire():
	if GameManager.chatting == false:
		debug.text = "Quemado"
		health -= 20
func poison():
	if GameManager.chatting == false:
		debug.text = "Envenenado"
		for i in range(5):
			health -= 4
			await get_tree().create_timer(1).timeout
 
func slow():
	debug.text = "Ralentizado"
	SPEED = 100
	await get_tree().create_timer(2).timeout
	SPEED = 150

func died():
	GameManager.dead = true
	var dead_screen = preload("res://scenes/muerte.tscn").instantiate()
	get_tree().root.add_child(dead_screen)
	dead_screen.z_index = 100
	get_tree().paused = true
	#queue_free() 

func stun():
	debug.text = "Aturdido"
	SPEED = 0
	await get_tree().create_timer(2.5).timeout
	SPEED = 150
