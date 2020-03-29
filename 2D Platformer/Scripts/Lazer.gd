extends Node2D
# Export: Makes a variable which can be edited/ placed in the inspector for the scene
export(String, FILE, "*.tscn") var world_scene
var activeTime =5
var disabledTime =3
var timer = null
var enabled = true

func _ready():
	lazerTimerActive()
	pass

func _physics_process(delta):
	
	if enabled == true:
		$Area2D.set_process(true)
		$AnimatedSprite.show()
	else:
		$Area2D.set_process(false)
		$AnimatedSprite.hide()
	
	var bodies = $Area2D.get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player" && enabled == true:
			get_tree().reload_current_scene()
	pass


func lazerTimerActive ():
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(activeTime)
	timer.connect("timeout", self, "onTimeoutCompleteActive")
	add_child(timer)
	timer.start()
	return
	
func onTimeoutCompleteActive():
	enabled = false
	lazerTimerDisabled()
	return
	
func lazerTimerDisabled():
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(disabledTime)
	timer.connect("timeout", self, "onTimeoutCompleteDisabled")
	add_child(timer)
	timer.start()
	return

func onTimeoutCompleteDisabled():
	enabled = true
	lazerTimerActive()
	return
	
