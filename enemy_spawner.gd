extends Node2D

enum EnemyType {RED, GREEN, BLUE, RANDOM}
@export var enemy_spawn_type : EnemyType
@export var spawn_rate : float 

var can_spawn = true

var Enemy = preload("res://enemy.tscn")
var current_enemy
func _ready():
	
	$spawn_time.wait_time = spawn_rate

func _on_spawn_time_timeout():
	if can_spawn:
		if current_enemy == null or current_enemy.attacking == true:
			current_enemy = Enemy.instantiate()
			current_enemy.enemy_type = enemy_spawn_type
			current_enemy.global_position = global_position
			get_tree().root.get_child(1).find_child("Enemies").add_child(current_enemy)


func _on_visible_on_screen_notifier_2d_screen_entered():
	can_spawn = false


func _on_visible_on_screen_notifier_2d_screen_exited():
	can_spawn = true
