extends Control

@export var r_texture : Control
@export var g_texture : Control
@export var b_texture : Control
@export var color_texture : Control

@export var battery_progress : Control
@export var battery_label : Label

var red_light = false
var green_light = false
var blue_light = false

signal color_update(new_color)

func _ready():
	update_color()
	#print(get_tree().root.get_node("HUD").get_node("MarginContainer3"))
	print(get_tree().root.get_child(1).name)


func _process(delta):
	
	if Global.color == Color.RED or Global.color == Color.BLUE or Global.color == Color.GREEN:
		Global.flashlight_battery -= 0.01
	
	if Global.color == Color.MAGENTA or Global.color == Color.YELLOW or Global.color == Color.CYAN:
		Global.flashlight_battery -= 0.02
		
	if Global.color == Color.WHITE:
		Global.flashlight_battery -= 0.03
	
	battery_progress.value = Global.flashlight_battery
	battery_label.text = "%3d" % Global.flashlight_battery + "%"
	
	if Input.is_action_just_pressed("key_red") or Input.is_action_just_pressed("key_green") or Input.is_action_just_pressed("key_blue"):
		$"AudioStreamPlayer-flashlight".play()
	
	if Global.flashlight_battery > 0:
		if Input.is_action_just_pressed("key_red"):
			if not red_light:
				r_texture.modulate = Color.RED
			else:
				r_texture.modulate = Color.WHITE
			# toggle variable
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
