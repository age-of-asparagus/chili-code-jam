extends Control
@onready var click_sound = $AudioStreamPlayerClick


func _on_start_button_pressed():
	click_sound.play()
	Global.player_health = 10
	Global.flashlight_battery = 100
	Global.game_over = false
	$AnimationPlayer.play("elevator_close")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file("res://Levels/Level0.tscn")
	
func _on_credits_button_pressed():
	click_sound.play()
	await click_sound.finished
	Global.game_over = false
	get_tree().change_scene_to_file("res://credits.tscn")
