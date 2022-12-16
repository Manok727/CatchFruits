extends RigidBody2D

signal hit

export var max_speed = 200.0
export var min_speed = 200.0

var screen_size = Vector2.ZERO

func _ready():
	screen_size = get_viewport_rect().size
	print(screen_size)
	start()
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func start():
	show()
	print("start")
	$CollisionShape2D.disabled = false
	position.x = clamp(position.x, 0, screen_size.x)


