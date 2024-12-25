extends CharacterBody2D

var health = 3
var speed = 150
@onready var navigation = $NavigationAgent2D
@onready var player = get_parent().get_node("Player")
var blood_splatter = preload("res://enemy_blood.tscn")

func _physics_process(delta):
	look_at(player.global_position)
	navigation.target_position = player.global_position
	velocity = global_position.direction_to(navigation.get_next_path_position())*speed
	move_and_slide()
	
	if health <= 0:
		queue_free()


func _on_attack_zone_body_entered(body):
	var blood = blood_splatter.instantiate()
	blood.global_position = global_position
	blood.Emitting = true
	get_parent().add_child(blood)
	body.health -= 1
	queue_free()
