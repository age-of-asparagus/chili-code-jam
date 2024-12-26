extends Marker2D

@onready var player = get_parent().get_node("Player")

func _process(delta):
	if Global.game_over == false:
		global_position = player.global_position - Vector2(-75,280)
