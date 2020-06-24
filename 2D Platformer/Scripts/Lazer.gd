extends Node2D

var lazerOn = true
var repitions = 0  


func _physics_process(delta):
	var currentAnimFrame = $AnimatedSprite.get_frame()
	
	# Uses the charging animation and on the final frame switches the lazer on
	if currentAnimFrame == 15 && $AnimatedSprite.get_animation() == "Charging":
		$AnimatedSprite.play("default")
		$Area2D.set_process(true)
		lazerOn = true
		repitions = 0
	
	# If lazer is on uses the final frame 3 to count repitions 
	if currentAnimFrame == 3 && $AnimatedSprite.get_animation() == "default":
		repitions += 1
		if repitions > 40:
			lazerOn = false
			$Area2D.set_process(false)
			$AnimatedSprite.play("Charging")
	
	# Controls when the sounds play
	if lazerOn == true:
		if($AudioStreamPlayer2D.playing == false):
			$AudioStreamPlayer2D.play(true)
	else: 
		$AudioStreamPlayer2D.stop()

	
	var bodies = $Area2D.get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player" && lazerOn == true:
			get_tree().reload_current_scene()
	pass
