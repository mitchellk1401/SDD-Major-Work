extends RichTextLabel

var msTime
var seconds = 0
var mins = 0 


func _physics_process(delta):
	msTime = OS.get_ticks_msec() / 1000
	seconds = msTime
	
	if seconds > 60:
		mins += 1
		seconds = OS.get_ticks_msec() / 1000 
		
	
	text = String(mins + seconds)
	
	pass
	
