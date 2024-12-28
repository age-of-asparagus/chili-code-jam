extends Control
@onready var click_sound = $AudioStreamPlayerClick

func _on_menu_button_pressed():
	Global.player_health = 10
	Global.flashlight_battery = 100
	click_sound.play()
	await click_sound.finished
	Global.game_over = false
	get_tree().change_scene_to_file("res://start_screen.tscn")
	
func _on_menu_button_2_pressed() -> void:
	Global.player_health = 10
	Global.flashlight_battery = 100
	click_sound.play()
	await click_sound.finished
	Global.game_over = false
	get_tree().change_scene_to_file("res://credits.tscn")
