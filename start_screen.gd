extends Node2D

func _on_start_button_button_down():
	get_tree().change_scene_to_file("res://Levels/Level1.tscn")


func _on_how_to_play_button_button_down():
	get_tree().change_scene_to_file("res://how_to_play.tscn")


func _on_credits_button_button_down():
	get_tree().change_scene_to_file("res://credits.tscn")
