extends PointLight2D

# dictionary mapping colors to the Item Cull Mask value
var color_mask_dict = {
	Color.BLACK: 0,
	Color.RED: 1,
	Color.YELLOW: 5, # Red layer + Green Layer + yellow(2) Layer
	Color.GREEN: 4, 
	Color.CYAN: 28, # green + blue + cyan(8) layer
	Color.BLUE: 16,
	Color.MAGENTA: 49, # red + blue + magenta(32)
	Color.WHITE: 63,
}

#var color_list = [Color.RED, Color.GREEN, Color.BLUE ]

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_color(Global.color)

func update_color(c: Color):
	# Set the color property on this PointLight2D
	self.color = c
	# Set the light to only interact with new color layer
	range_item_cull_mask = color_mask_dict[c]
	
