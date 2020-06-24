extends RichTextLabel

var time = 0
var timeMult = 1.0
var paused = false
var mins = 0
var gameRunning 


# Script runs in autorun for the project in order to allow for the time to not be reset between scenes
# Script called in UICount in order to display.

func _process(delta):
	if gameRunning == true:
		if time < 60:
			time += stepify(delta * 1, 0.01) # Round to one decimal point
		else:
			mins += 1
			time = 0
	pass
