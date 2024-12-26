class_name BaseLight
extends PointLight2D

enum LightColorEnum { RED, YELLOW, GREEN, CYAN, BLUE, MAGENTA, WHITE }
@export var light_color: LightColorEnum

# Connect the exported list color selector with a Color object
var light_color_dictionary = {
	LightColorEnum.WHITE: Color.WHITE,
	LightColorEnum.RED: Color.RED,
	LightColorEnum.YELLOW: Color.YELLOW,
	LightColorEnum.GREEN: Color.GREEN,
	LightColorEnum.CYAN: Color.CYAN,
	LightColorEnum.BLUE: Color.BLUE,
	LightColorEnum.MAGENTA: Color.MAGENTA,
}

# Dictionary mapping colors to the Item Cull Mask value
var color_mask_dict = {
	Color.BLACK: 0,
	Color.RED: 1,
	Color.YELLOW: 5, # Red layer + Green Layer + yellow(2) Layer
	Color.GREEN: 4, 
	Color.CYAN: 28, # green + blue + cyan(8) layer
	Color.BLUE: 16,
	Color.MAGENTA: 49, # red + blue + magenta(32)
	Color.WHITE: 63, # all of above added together
}


func _ready():
	update_color(light_color_dictionary[light_color])

func _process(delta):
	pass
	
func update_color(c: Color):
	# Set the color property on this PointLight2D
	self.color = c
	# Set the light to only interact with new color layer
	self.range_item_cull_mask = color_mask_dict[c]
