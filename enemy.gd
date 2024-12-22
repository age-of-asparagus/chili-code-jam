extends CharacterBody2D

var speed = 300
@onready var navigation = $NavigationAgent2D

func _physics_process(delta):
	pass
	#navigation.target_position = (get the players position)
	
