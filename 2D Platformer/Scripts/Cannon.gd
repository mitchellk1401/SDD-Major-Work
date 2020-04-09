extends Node2D

var frame = 0
var player = null
var scene = load("res://Scenes/ObjectScenes/CannonBall.tscn")
var shot = false
var timer = null


func _physics_process(delta):
	var player = scene.instance()
	frame = $AnimatedSprite.get_frame()
	if frame == 5 && shot != true:
		shot = true
		cannonShoot()
		$ShootingPoint.add_child(player)
		$AudioStreamPlayer2D.play(true)
	
		
		

func cannonShoot():
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(0.3)
	timer.connect("timeout", self, "canShoot")
	add_child(timer)
	timer.start()
	return  

func canShoot():
	shot = false
	$AudioStreamPlayer2D.stop()
