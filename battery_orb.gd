extends Area2D

var collected = false
var velocity = Vector2.ZERO
var speed = 1

func _process(delta):
	if collected:
		var direction = (get_parent().get_node("orb_position").global_position - global_position).normalized()
		velocity += direction * speed
		global_position += velocity

func _on_body_entered(body):
	collected = true
	$AnimationPlayer.play("Orb_Collected")

func done_collecting():
	Global.flashlight_battery += 5
	if Global.flashlight_battery > 100:
		Global.flashlight_battery = 100
	queue_free()
