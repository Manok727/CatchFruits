extends RigidBody2D

signal hit

export var max_speed = 200.0
export var min_speed = 200.0


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func start(new_position):
	show()
	$CollisionShape2D.disabled = false

func _on_RigidBody2D_body_entered(body):
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
	emit_signal("hit")
