extends Area2D

signal catch

export var speed = 700
var screen_size = Vector2.ZERO

func _ready():
	screen_size = get_viewport_rect().size
	print(screen_size)

func _process(delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	
	if direction.length() > 1:
		direction = direction.normalized()

	position.x += direction.x * speed * delta
	position.x = clamp(position.x, 0, screen_size.x)





func _on_Catcher_body_entered(body):
	print("catched")
	body.queue_free()
	emit_signal("catch")
