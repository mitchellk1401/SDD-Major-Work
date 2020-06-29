# Controls the timer the player sees, Values supplied from counter.gd which is initialised onLoad
extends RichTextLabel

onready var count = get_node("/root/Counter")

var time
var mins

func _physics_process(delta):
	time = count.time
	mins = count.mins
	
	text = String(mins) + ":"+ String(time)
	
	pass
