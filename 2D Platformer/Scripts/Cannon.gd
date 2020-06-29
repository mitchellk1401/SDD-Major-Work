# Controls the cannon and the instanciation of the cannonball
extends Node2D

var frame = 0
var ball = null
var scene = load("res://Scenes/ObjectScenes/CannonBall.tscn")
var shot = false
var timer = null


func _physics_process(delta):
	var ball = scene.instance() #ball is instansiatated from scene 
	frame = $AnimatedSprite.get_frame() 
	if frame == 5 && shot != true: # Frame 5 is the frame where the cannon shoots in the animation
		shot = true
		cannonShoot()
		$ShootingPoint.add_child(ball)
		$AudioStreamPlayer2D.play(true)
	
		
		

# Uses a timer in order to not shoot multiple times on a single frame
func cannonShoot():
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(0.3)
	timer.connect("timeout", self, "canShoot") # When timer timesout i.e reaches zero calles function in 3rd parameter
	add_child(timer) #Creates child object
	timer.start()
	return  

func canShoot():
	shot = false
	$AudioStreamPlayer2D.stop()
