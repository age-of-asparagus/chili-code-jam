extends PointLight2D

@onready var player = $".."  # .. = up one level
# Called when the node enters the scene tree for the first time.

# dictionary mapping colors to the Item Cull Mask value
var color_mask_dict = {
	Color.RED: 1,
	Color.YELLOW: 2,
	Color.GREEN: 4, 
	Color.CYAN: 8,
	Color.BLUE: 16,
	Color.MAGENTA: 32,
}

var color_list = [Color.RED, Color.GREEN, Color.BLUE ]
var current_color = 0

func _ready():
	update_color(color_list[current_color])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("key_red"):
		update_color(Color.RED)
	if Input.is_action_pressed("key_blue"):
		update_color(Color.BLUE)
	if Input.is_action_pressed("key_green"):
		update_color(Color.GREEN)
		
	if Input.is_action_pressed("key_white"):
		update_color(Color.WHITE)
		
	if Input.is_action_just_pressed("key_color_rotate"):
		current_color += 1
		if color_list.size() <= current_color:
			current_color = 0
		
		update_color(color_list[current_color])
	
func update_color(c: Color):
	# Set the color property on this PointLight2D
	self.color = c
	# Set the light to only interact with new color layer
	if c == Color.WHITE:
		range_item_cull_mask = 63  # All color masks: 32 + 16 + 8 + 4 + 2 + 1
	else:
		range_item_cull_mask = color_mask_dict[c]
	
