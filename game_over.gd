extends Control

@onready var click_sound = $AudioStreamPlayerClick

var levels = ["res://Levels/Level0.tscn","res://Levels/level1.tscn","res://Levels/level2.tscn","res://Levels/level3.tscn","res://Levels/level4.tscn","res://win_screen.tscn"]

func _on_menu_button_pressed():
	click_sound.play()
	await click_sound.finished
	Global.game_over = false
	get_tree().change_scene_to_file("res://start_screen.tscn")
	

func _on_menu_button_2_pressed() -> void:
	click_sound.play()
	await click_sound.finished
	Global.game_over = false
	get_tree().change_scene_to_file("res://credits.tscn")
	
