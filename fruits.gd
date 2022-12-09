extends RigidBody2D

signal hit

export var max_speed = 200.0
export var min_speed = 200.0

var screen_size = Vector2.ZERO

func _ready():
	screen_size = get_viewport_rect().size
	print(screen_size)
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func start(new_position):
	show()
	$CollisionShape2D.disabled = false
	position.x = clamp(position.x, 0, screen_size.x)

func _on_RigidBody2D_body_entered(body):
	self.queue_free()
	$CollisionShape2D.set_deferred("disabled", true)
	emit_signal("hit")

