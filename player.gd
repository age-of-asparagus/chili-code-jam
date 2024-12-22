extends CharacterBody2D

var speed = 500
var direction = Vector2.ZERO


func _physics_process(delta):
	
	direction = Vector2.ZERO
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	
	velocity += direction.normalized()*speed
	
	look_at(get_global_mouse_position())
	
	
	move_and_slide()
	
