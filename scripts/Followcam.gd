class_name camera extends Camera2D

@export var follow_node: Node2D
@export var tilemap: TileMap

func _ready():
	var mapRect = tilemap.get_used_rect()
	var tileSize = tilemap.rendering_quadrant_size
	var worldSizeInPixels = mapRect.size * tileSize
	limit_right = worldSizeInPixels.x
	limit_bottom = worldSizeInPixels.y
	limit_left = 0
	limit_top = 0
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = follow_node.global_position
