extends Control

@export var r_texture : Control
@export var g_texture : Control
@export var b_texture : Control
@export var color_texture : Control

@export var battery_progress : Control
@export var battery_label : Label

@export var health_progress : Control
@export var health_label : Label

var red_light = false
var green_light = false
var blue_light = false

var flashlight_battery = Global.flashlight_battery
var level = Global.level
var player_health = Global.player_health

signal color_update(new_color)

func _ready():
	Global.level_completed = true
	$AnimationPlayer.play("level_animation_open")
	await $AnimationPlayer.animation_finished
	Global.level_completed = false
	update_color()


func _process(delta):
	
	if level != Global.level:
		level = Global.level
		$AnimationPlayer.play("level_animation_close")
	
	if player_health != Global.player_health:
		player_health = Global.player_health
		$AnimationPlayer.play("health_bar_flicker")
	
	if flashlight_battery < Global.flashlight_battery:
		$AnimationPlayer.play("battery_bar_flicker")
	
	flashlight_battery = Global.flashlight_battery
	
	if Global.color == Color.RED or Global.color == Color.BLUE or Global.color == Color.GREEN:
		Global.flashlight_battery -= 0.02
	
	if Global.color == Color.MAGENTA or Global.color == Color.YELLOW or Global.color == Color.CYAN:
		Global.flashlight_battery -= 0.04
		
	if Global.color == Color.WHITE:
		Global.flashlight_battery -= 0.06
	
	battery_progress.value = Global.flashlight_battery
	battery_label.text = "%3d" % Global.flashlight_battery + "%"
	
	health_progress.value = Global.player_health
	
	if Input.is_action_just_pressed("key_red") or Input.is_action_just_pressed("key_green") or Input.is_action_just_pressed("key_blue"):
		$"AudioStreamPlayer-flashlight".play()
	
	if Global.flashlight_battery > 0:
		if Input.is_action_just_pressed("key_red"):
			if not red_light:
				r_texture.modulate = Color.RED
			else:
				r_texture.modulate = Color.WHITE
			red_light = not red_light
			
		if Input.is_action_just_pressed("key_green"):
			if not green_light:
				g_texture.modulate = Color.GREEN
			else:
				g_texture.modulate = Color.WHITE
			# toggle variable
			green_light = not green_light
		if Input.is_action_just_pressed("key_blue"):
			if not blue_light:
				b_texture.modulate = Color.BLUE
			else:
				b_texture.modulate = Color.WHITE
			# toggle variable
			blue_light = not blue_light
	else:
		red_light = false
		blue_light = false
		green_light = false
		r_texture.modulate = Color.WHITE
		b_texture.modulate = Color.WHITE
		g_texture.modulate = Color.WHITE
	
	update_color()
		
func update_color():
	var c = Color.BLACK
	if red_light:
		c += Color.RED
	if green_light:
		c += Color.GREEN
	if blue_light:
		c += Color.BLUE
		
	var new_color: Color = c.clamp()
	
	Global.color = new_color
	
	# if all colors are off, change to the empty circle sprite
	if c == Color.BLACK:
		color_texture.disabled = true # Use the button's disabled texture
		new_color = Color.WHITE
	else: # otherwise, set the filled circle to the correct color
		color_texture.disabled = false
		
	color_texture.modulate = new_color
	
func display_info_box(index, displayed):
	var info_box: Control = $InfoBoxes.get_child(index)
	info_box.visible = displayed
	if displayed: 
		$"AudioStreamPlayer-infobox".play()
	else:
		$"AudioStreamPlayer-infoclose".play()
