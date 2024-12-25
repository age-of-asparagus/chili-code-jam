extends Control

@onready var r_texture = $MarginContainer/VBoxContainer/R
@onready var g_texture = $MarginContainer/VBoxContainer/G
@onready var b_texture = $MarginContainer/VBoxContainer/B
@onready var color_texture = $MarginContainer/VBoxContainer/Color

var red_light = false
var green_light = false
var blue_light = false

# Called when the node enters the scene tree for the first time.
func _ready():
	update_color()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
		
func update_color():
	var c = Color.BLACK
	if red_light:
		c += Color.RED
	if green_light:
		c += Color.GREEN
	if blue_light:
		c += Color.BLUE
	
	color_texture.modulate = c.clamp()	
	
	# if all colors are off, change to the empty circle sprite
	if c == Color.BLACK:
		color_texture.disabled = true # Use the button's disabled texture
		color_texture.modulate = Color.WHITE
	else: # otherwise, set the filled circle to the correct color
		color_texture.disabled = false
		
		
