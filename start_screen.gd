extends Control
@onready var click_sound = $AudioStreamPlayerClick


func _on_how_to_play_button_button_down():
	click_sound.play()
	get_tree().change_scene_to_file("res://how_to_play.tscn")


func _on_start_button_pressed():
	click_sound.play()
	await click_sound.finished
	get_tree().change_scene_to_file("res://Levels/Level0.tscn")


func _on_credits_button_pressed():
	click_sound.play()
	await click_sound.finished
	get_tree().change_scene_to_file("res://credits.tscn")
