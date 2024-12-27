extends Control
@onready var click_sound = $AudioStreamPlayerClick

func _on_start_button_pressed():
	click_sound.play()
	await click_sound.finished
	get_tree().change_scene_to_file("res://start_screen.tscn")


func _on_title_meta_clicked(meta):
# This assumes RichTextLabel's `meta_clicked` signal was connected to
# the function below using the signal connection dialog.

	# `meta` is not guaranteed to be a String, so convert it to a String
	# to avoid script errors at run-time.
	OS.shell_open(str(meta))
