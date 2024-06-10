extends CharacterBody2D

var current_dir: String = "down"
const  SPEED: int = 100

func _ready():
	$AnimatedSprite2D.play("front_idle")

func _physics_process(delta):
	player_movement(delta)

func player_movement(delta) -> void:
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

	
#var enemy_in_attack_range: bool = false
#var enemy_attack_cooldown: bool = true
#var health: int = 100
#var player_alive: bool = true
#
#var attack_ip = false
#
#const  SPEED: int = 100
#
#var current_dir: String = "down"
#
#func _ready() -> void:
	#$AnimatedSprite2D.play("front_idle")
#
#func _physics_process(delta) -> void:
	#player_movement(delta)
	#enemy_attack()
	#attack()
	#current_camera()
	#
	#if health <= 0 :
		#player_alive = false  #end-screen
		#health = 078
		#print("player has ben killed")
		#self.queue_free()
#
#
#func player_movement(delta) -> void:
	#if Input.is_action_pressed("ui_right"):
		#current_dir = "right"
		#play_anim(1)
		#velocity.x = SPEED
		#velocity.y = 0
	#elif Input.is_action_pressed("ui_left"):
		#current_dir = "left"
		#play_anim(1)
		#velocity.x = -SPEED
		#velocity.y = 0
	#elif Input.is_action_pressed("ui_down"):
		#current_dir = "down"
		#play_anim(1)
		#velocity.y = SPEED
		#velocity.x = 0
	#elif Input.is_action_pressed("ui_up"):
		#current_dir = "up"
		#play_anim(1)
		#velocity.y = -SPEED
		#velocity.x = 0
	#else:
		#play_anim(0)
		#velocity.y = 0
		#velocity.x = 0
	#move_and_slide()
	#
	#
#func play_anim(movement) -> void:
	#var dir = current_dir
	#var anim = $AnimatedSprite2D
	#match dir:
		#"right":
			#anim.flip_h = false
			#if movement == 1:
				#anim.play("side_walk")
			#elif movement == 0:
				#if attack_ip == false:
					#anim.play("side_idle")
		#"left":
			#anim.flip_h = true
			#if movement == 1:
				#anim.play("side_walk")
			#elif movement == 0:
				#if attack_ip == false:
					#anim.play("side_idle")
		#"down":
			#anim.flip_h = true
			#if movement == 1:
				#anim.play("front_walk")
			#elif movement == 0:
				#if attack_ip == false:
					#anim.play("front_idle")
		#"up":
			#anim.flip_h = true
			#if movement == 1:
				#anim.play("back_walk")
			#elif movement == 0:
				#if attack_ip == false:
					#anim.play("back_idle")
#
#func _on_player_hit_box_body_entered(body):
	#if body.is_in_group("enemy"):
		#enemy_in_attack_range = true
		#
#
#
#func _on_player_hit_box_body_exited(body):
	#if body.is_in_group("enemy"):
		#enemy_in_attack_range = false
		#
		#
		#
#func enemy_attack():
	#if enemy_in_attack_range == true and enemy_attack_cooldown == true:
		#health -= 20
		#enemy_attack_cooldown = false
		#$attack_cooldown.start()
		#print(health)
	#
#func _on_attack_cooldown_timeout():
	#enemy_attack_cooldown = true
	#
#func attack():
	#var dir = current_dir
	#if Input.is_action_just_pressed("attack"):
		#GameManager.player_current_atatck = true
		#attack_ip = true
		#if dir == "right":
			#$AnimatedSprite2D.flip_h = false
			#$AnimatedSprite2D.play("side_attack")
			#$deal_attack_cooldown.start()
		#if dir == "left":
			#$AnimatedSprite2D.flip_h = true
			#$AnimatedSprite2D.play("side_attack")
			#$deal_attack_cooldown.start()
		#if dir == "down":
			#$AnimatedSprite2D.play("front_attack")
			#$deal_attack_cooldown.start()
		#if dir == "up":
			#$AnimatedSprite2D.play("back_attack")
			#$deal_attack_cooldown.start()
