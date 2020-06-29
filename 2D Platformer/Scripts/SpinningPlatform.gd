extends KinematicBody2D

var rotationSpeed = 1.5

func _process(delta):
	rotation -= rotationSpeed * delta
	pass
