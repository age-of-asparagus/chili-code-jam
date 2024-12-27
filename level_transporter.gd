extends Area2D

var levels = ["res://Levels/Level0.tscn","res://Levels/level1.tscn"]

func _on_body_entered(body):
	Global.level_completed = true
	Global.level += 1
	$AnimationPlayer.play("DoorClose")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(levels[Global.level])
