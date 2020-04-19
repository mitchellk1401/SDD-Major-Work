extends KinematicBody2D
var collide = null
var direction = Vector2()
var directionalSpeed = 4

func _ready():
	direction.x = directionalSpeed


# Platform moves in direction based on directionalSpeed and changes when colliding with an object and based on sizing of collisionShapes, if player
# hits the side of the platform it changes direction
func _physics_process(delta):
	var collide = move_and_collide(direction)
	
	if collide: # Collide true with any collision (built into move_and_collide)
		if direction.x > 0:
			direction.x = -directionalSpeed
		else:
			direction.x = directionalSpeed
