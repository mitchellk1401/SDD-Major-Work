# Controls the instanciated object created by the cannon, ensures that the movement direction is correct based on parent orientation.
extends KinematicBody2D

var rotationCannon = 0
var projSpeed = 3
var bodies = null
var collide = null
var direction = Vector2()
var timer = null
var cannonSprite = null

func _ready():
	var cannon = get_parent().get_parent()
	rotationCannon = cannon.get_rotation_degrees()
	rotationCannon = int(round(rotationCannon)) # Small Chance the godot engine sets the variable as a float so make it a rounded int to avoid errors
	
	
		# Based on the rotation in the scene view the projectiles vector is updated in order to shoot in the correct direction
	if rotationCannon == 0:
		direction.x = projSpeed
		direction.y = 0	
	elif rotationCannon == 90:
		direction.x = 0
		direction.y = projSpeed
	elif rotationCannon == 180:
		direction.x = -projSpeed
		direction.y = 0
	elif rotationCannon == 270:
		direction.x = 0
		direction.y = -projSpeed
	
	
	
func _physics_process(delta):	 
	var bodies = $Area2D.get_overlapping_bodies()
	var collide = move_and_collide(direction)
	
	for body in bodies:
		if body.name == "Player":
			get_tree().reload_current_scene()
	
	if collide: # Collide true with any collision (built into move_and_collide)
		deleteDelay()

func deleteDelay(): # Allows Player to be noticed before deleting
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(0.05)
	timer.connect("timeout", self, "Delete") # When timer timesout i.e reaches zero calles function in 3rd parameter
	add_child(timer)
	timer.start()
	return  

func Delete():
	queue_free() #Removes game object without causing warnings
