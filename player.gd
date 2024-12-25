extends CharacterBody2D

var flashlight_battery = 100
var health = 1
var speed = 300
var moving_direction = Vector2.ZERO
var Bullet_Scene = preload("res://player_bullet.tscn")
var can_shoot = true

func _physics_process(delta):
	
	if Global.color == Color.RED or Global.color == Color.BLUE or Global.color == Color.GREEN:
		flashlight_battery -= 0.01
	
	if Global.color == Color.MAGENTA or Global.color == Color.YELLOW or Global.color == Color.CYAN:
		flashlight_battery -= 0.02
		
	if Global.color == Color.WHITE:
		flashlight_battery -= 0.03
	
	Global.flashlight_battery = flashlight_battery
	
	print(flashlight_battery)
	
	
	if health <= 0:
		queue_free()
	
	moving_direction = Vector2.ZERO
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		moving_direction.x += 1
	if Input.is_action_pressed("ui_left"):
		moving_direction.x -= 1
	if Input.is_action_pressed("ui_up"):
		moving_direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		moving_direction.y += 1
	
	velocity += moving_direction.normalized()*speed
	
	look_at(get_global_mouse_position())
	
	move_and_slide()
	
	if Input.is_action_pressed("Left_Click") and can_shoot:
		shoot_bullet()


func shoot_bullet():
	can_shoot = false
	$firerate_timer.start()
	var bullet = Bullet_Scene.instantiate()
	bullet.direction = Vector2(1,0).rotated($gun_sprite.global_rotation)
	bullet.global_position = $bullet_spawn.global_position
	get_parent().add_child(bullet)


func _on_firerate_timer_timeout():
	can_shoot = true
