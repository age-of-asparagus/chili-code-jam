extends AudioStreamPlayer2D

@export var sounds: Array[AudioStream]
# Called when the node enters the scene tree for the first time.
func _ready():
	if sounds.size() == 0:
		print("MultiAudioStreamPlayer does not have any audio streams.")
	pick_random_sound()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func pick_random_sound():
	stream = sounds.pick_random()


func _on_finished():
	pick_random_sound()
