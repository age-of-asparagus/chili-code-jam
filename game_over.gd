extends Node2D



func _on_main_menu_button_button_down():
	Global.game_over = false
	get_tree().change_scene_to_file("res://start_screen.tscn")


func _on_try_again_button_button_down():
	Global.game_over = false
	get_tree().change_scene_to_file("res://Levels/Level0.tscn")
