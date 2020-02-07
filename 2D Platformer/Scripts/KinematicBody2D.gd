extends KinematicBody2D

const FLOOR = Vector2(0, -1)
const ACCELERATION = 50
const MAX_SPEED = 500
const JUMP_HEIGHT = -350
var Sprint = 1
var SlowEnabled = 1
var Gravity = 10
var jumped = false
var wallPush = 525

var motion = Vector2() 

#use $ to access child objects

		
func _physics_process(delta):
	movement()
	timeSlow()
	
	pass
	
func  movement():
	var friction = false
	var touchedWall = false
	var left = false

	
	# Sprint Modifier -- "ui_sprint" is a custom input for SHIFT key
	if Input.is_action_just_pressed("ui_sprint"):
		Sprint = 1.3
	if Input.is_action_just_released("ui_sprint"):
		Sprint = 1

	#Motion Controls
	if Input.is_action_pressed("ui_right"):		
		motion.x = min(motion.x + ACCELERATION , MAX_SPEED * Sprint * SlowEnabled)
		$Sprite.flip_h = false
		left = false
		$Sprite.play("Run")
		
		
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED * Sprint * SlowEnabled)
		$Sprite.flip_h = true
		left = true
		$Sprite.play("Run")
		
	else:
		motion.x = 0	
		$Sprite.play("Idle")
		friction = true

	
	if is_on_wall() && is_on_floor() == false:
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT  *1.2
			if left == true:
				motion.x = wallPush *0.7
			else:
				motion.x = -wallPush * 0.7
			jumped = true
		
		
	# Check if player is on floor and play correct motion
	if is_on_floor():
		jumped = false
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.9) #make movement smoother
	else:
		if motion.y > 0:
			$Sprite.play("Jump")	
		else:
			$Sprite.play("Fall")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.1) #make movement smoother
			
	
	motion.y += Gravity
	
	motion = move_and_slide(motion, FLOOR)
	pass
	
func timeSlow():
	# Slow the entire game down to half when recieves input
	# Slow enable allows player to continue to move at full speed
	if Input.is_action_just_pressed("ui_timeSlow"):
		Engine.time_scale = 0.5
		SlowEnabled = 2
	if Input.is_action_just_released("ui_timeSlow"):
		Engine.time_scale = 1
		SlowEnabled =1
		
	pass

func testing():
	print("10 second timer")
	yield (get_tree().create_timer(10), "timeout")
	print("timed out") 
	pass
