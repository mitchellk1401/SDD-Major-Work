extends RichTextLabel

var time = 0
var timeMult = 1.0
var paused = false
var mins = 0
var gameRunning 

	
func _process(delta):
	print(gameRunning)
	if gameRunning == true:
		if time < 60:
			time += stepify(delta * 1, 0.01)
		else:
			mins += 1
			time = 0
			timerRunning(delta)
	pass


func timerRunning(delta):

		
		
	text = String(mins) + ":"+ String(time)
	
	pass
