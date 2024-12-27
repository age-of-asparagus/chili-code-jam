extends Area2D

var velocity : Vector2
var speed = 10
var direction : Vector2
var delete = false

func _ready():
	look_at(global_position+direction)


func _process(delta):
	velocity = direction*speed
	global_position += velocity
	
	#if delete:
		#monitoring = false

	if delete and not $"AudioStreamPlayer-Gunshot".playing:
		queue_free()


func _on_body_entered(body):
	if "health" in body:
		body.health -= 1
		body.hit()
	if $"AudioStreamPlayer-Gunshot".playing:
		delete = true
		hide()
		set_deferred("monitoring",false)
	else:
		queue_free()
		
