extends Area2D

@onready var hud := $"../../CanvasLayer/HUD"
@export var index := 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	hud.display_info_box(index, true)

func _on_body_exited(body):
	hud.display_info_box(index, false)
