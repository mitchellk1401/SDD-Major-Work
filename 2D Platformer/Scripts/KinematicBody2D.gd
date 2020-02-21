extends KinematicBody2D

const FLOOR = Vector2(0, -1)
const ACCELERATION = 30
const MAX_SPEED = 450
const JUMP_HEIGHT = -380
var Sprint = 1
var Gravity = 10
var jumped = false
var wallPush = 525
var motion = Vector2() 

#use $ to access child objects

func _physics_process(delta):
	movement()
	
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
		motion.x = min(motion.x + ACCELERATION , MAX_SPEED * Sprint)
		$Sprite.flip_h = false
		left = false
		$Sprite.play("Run")
		
		
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED * Sprint)
		$Sprite.flip_h = true
		left = true
		$Sprite.play("Run")
		
	else:
		motion.x = 0	
		$Sprite.play("Idle")
		friction = true
	
	# Add fast falling
	if Input.is_action_pressed("ui_down"):
		motion.y += 35
		
	# Check if player is on floor and play correct motion
	if is_on_floor():
		jumped = false
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT 
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.9) #make movement smoother
			
	#Wall Jumping
	elif is_on_wall() && is_on_floor() == false :
		$Sprite.play("WallHold")
		#Slows the effect of gravity on the player showing the player sliding down the wall
		motion.y = motion.y * 0.9 
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT 
			if left == true:
				motion.x = wallPush * 0.8
			else:
				motion.x = -wallPush * 0.8 
			# Add a delay on the next input after the player jumps off the wall alowing for the jump to carry its initial velocity
			yield (get_tree().create_timer(1.8), "timeout")			
			jumped = true
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
	

	
