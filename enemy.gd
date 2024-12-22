extends CharacterBody2D

var speed = 300
@onready var navigation = $NavigationAgent2D
@onready var player = get_parent().get_node("Player")

func _physics_process(delta):
	look_at(player.global_position)
	navigation.target_position = player.global_position
	velocity = global_position.direction_to(navigation.get_next_path_position())*speed
	move_and_slide()
