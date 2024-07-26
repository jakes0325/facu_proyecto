extends CharacterBody2D
signal end

var theta: float = 0.0
@export_range(0,2*PI) var alpha: float = 0.0
@onready var progress_bar = $ProgressBar
var health:int = 1000:
	set(value):
		health = value
		progress_bar.value = value
		
@export var bullet_node:PackedScene
var bullet_type: int = 0

func _physics_process(delta):
	if health <= 0:
		_on_end_battle()

func get_vector(angle):
	theta = angle + alpha
	return Vector2(cos(theta),sin(theta))
	
func shoot(angle):
	var bullet = bullet_node.instantiate()
	
	bullet.position = global_position
	bullet.direction = get_vector(angle)
	bullet.set_property(bullet_type)
	
	get_tree().current_scene.call_deferred("add_child",bullet)


func _on_speed_timeout():
	shoot(theta)


func _on_end_battle():
	end.emit()
	queue_free()


func _on_hit_box_area_entered(area):
	if area.is_in_group("player_bullet"):
		health -= 25
