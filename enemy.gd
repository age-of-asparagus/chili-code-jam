extends CharacterBody2D

@export var health = 3
@export var speed = 150
@export var Explosion : PackedScene

enum EnemyType {RED, GREEN, BLUE, RANDOM}
@export var enemy_type : EnemyType

@onready var navigation = $NavigationAgent2D
@onready var root_node = get_tree().root.get_child(1)
@onready var player = get_tree().root.get_child(1).get_node("Player")
@onready var Sound = $AudioStreamPlayer2D

var attacking = false
var damaging = false

var battery_orb_scene = preload("res://battery_orb.tscn")

var blood_splatter = preload("res://enemy_blood.tscn")

var sprite_red = preload("res://Assets/Kenny/kenney_space-shooter-redux/PNG/ufoRed.png")
var sprite_blue = preload("res://Assets/Kenny/kenney_space-shooter-redux/PNG/ufoBlue.png") 
var sprite_green = preload("res://Assets/Kenny/kenney_space-shooter-redux/PNG/ufoGreen.png")

var color_picked

var color_options = [
	[1,sprite_red,Color.RED],
	[4,sprite_green,Color.GREEN],
	[16,sprite_blue,Color.BLUE]
]


func _ready():
	match enemy_type:
		EnemyType.RANDOM:
			color_picked = color_options.pick_random()
		EnemyType.RED:
			color_picked = color_options[0]
		EnemyType.GREEN:
			color_picked = color_options[1]
		EnemyType.BLUE:
			color_picked = color_options[2]
	
	$Sprite2D.light_mask = color_picked[0]
	$Sprite2D.texture = color_picked[1]
	
	Sound.play()

func _physics_process(delta):
	
	if damaging:
		Global.player_health -= 0.03
		if not $"AudioStreamPlayer2D-Playerhit".playing:
			$"AudioStreamPlayer2D-Playerhit".play()
	
	$Sprite2D.rotate(0.05)
	if not Global.level_completed:
		look_at(player.global_position)
		navigation.target_position = player.global_position
		velocity = global_position.direction_to(navigation.get_next_path_position())*speed
	if attacking:
		move_and_slide()
	
	if health <= 0:
		die()

func hit():
	var blood : CPUParticles2D = blood_splatter.instantiate()
	blood.global_position = global_position
	blood.color = color_picked[2]
	blood.emitting = true
	root_node.add_child(blood)
	$"AudioStreamPlayer2D-Hit".play()

func die():
	var battery_orb = battery_orb_scene.instantiate()
	battery_orb.global_position = global_position
	root_node.add_child(battery_orb)
	var explosion: Node2D = Explosion.instantiate()
	explosion.global_position = global_position
	root_node.add_child(explosion)
	
	queue_free()

func _on_audio_stream_player_2d_finished():
	Sound.play()


func _on_visible_on_screen_notifier_2d_screen_entered():
	attacking = true


func _on_attack_zone_body_exited(body):
	damaging = false


func _on_attack_zone_body_entered(body):
	damaging = true
