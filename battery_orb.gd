extends Area2D

var collected = false
var velocity = Vector2.ZERO
var speed = 1

func _process(delta):
	
	if collected:
		var direction = (get_tree().root.get_child(1).get_node("orb_position").global_position - global_position).normalized()
		velocity += direction * speed
		global_position += velocity

func _on_body_entered(body):
	collected = true
	$AnimationPlayer.play("Orb_Collected")
	$AudioStreamPlayer.play()

func done_collecting():
	Global.flashlight_battery += 1
	if Global.flashlight_battery > 100:
		Global.flashlight_battery = 100
	queue_free()
