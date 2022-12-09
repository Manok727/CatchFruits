extends Node

export (PackedScene) var fruits_scene

func _ready():
	randomize()

func _on_Timer_timeout():
	var fruit_spawn_location = $Path2D/FruitSpawnLocation
	fruit_spawn_location.unit_offset = randf()

	var fruits = fruits_scene.instance()
	add_child(fruits)
	
	fruits.position = fruit_spawn_location.position
	
	var direction = fruit_spawn_location.rotation + PI / 2
	direction += rand_range(-PI / 4, PI / 4)
	fruits.rotation = direction
	
	var velocity = Vector2(rand_range(fruits.min_speed, fruits.max_speed), 0)
	fruits.linear_velocity = velocity.rotated(direction)
