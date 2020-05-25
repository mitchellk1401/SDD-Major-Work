extends RichTextLabel

var time = 0
var timeMult = 1.0
var paused = false
var mins = 0

func _ready():
	set_process(true)

func _process(delta):
	if !paused:
		if time < 60:
			time += stepify(delta * 1, 0.01)
		else:
			mins += 1
			time = 0
		
		
	text = String(mins) + " : "+ String(time)
