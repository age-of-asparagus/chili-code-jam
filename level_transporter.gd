extends Area2D

var levels = ["res://Levels/Level0.tscn","res://Levels/level1.tscn"]

func _on_body_entered(body):
	Global.level += 1
	get_tree().change_scene_to_file(levels[Global.level])
