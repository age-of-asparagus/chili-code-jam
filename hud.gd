extends Control

var flashlight_battery = 10

@onready var r_texture = $MarginContainer/VBoxContainer/R
@onready var g_texture = $MarginContainer/VBoxContainer/G
@onready var b_texture = $MarginContainer/VBoxContainer/B
@onready var color_texture = $MarginContainer/VBoxContainer/Color

var red_light = false
var green_light = false
var blue_light = false

signal color_update(new_color)

func _ready():
	update_color()

func _process(delta):
	
	if Global.color == Color.RED or Global.color == Color.BLUE or Global.color == Color.GREEN:
		flashlight_battery -= 0.01
	
	if Global.color == Color.MAGENTA or Global.color == Color.YELLOW or Global.color == Color.CYAN:
		flashlight_battery -= 0.02
		
	if Global.color == Color.WHITE:
		flashlight_battery -= 0.03
	
	Global.flashlight_battery = flashlight_battery
	$flashlight_battery.value = flashlight_battery
	
	if flashlight_battery > 0:
		if Input.is_action_just_pressed("key_red"):
			if not red_light:
				r_texture.modulate = Color.RED
			else:
				r_texture.modulate = Color.WHITE
			# toggle variable
			red_light = not red_light
			update_color()
			
		if Input.is_action_just_pressed("key_green"):
			if not green_light:
				g_texture.modulate = Color.GREEN
			else:
				g_texture.modulate = Color.WHITE
			# toggle variable
			green_light = not green_light
			update_color()
		if Input.is_action_just_pressed("key_blue"):
			if not blue_light:
				b_texture.modulate = Color.BLUE
			else:
				b_texture.modulate = Color.WHITE
			# toggle variable
			blue_light = not blue_light
			update_color()
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
