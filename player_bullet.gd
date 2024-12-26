extends Area2D

var velocity : Vector2
var speed = 10
var direction : Vector2

func _ready():
	look_at(global_position+direction)


func _process(delta):
	velocity = direction*speed
	global_position += velocity


func _on_body_entered(body):
	if "health" in body:
		body.health -= 1
		body.hit()
	if $"AudioStreamPlayer-Gunshot".playing:
		pass
	else:
		queue_free()
