extends KinematicBody2D

const FLOOR = Vector2(0, -1)
const ACCELERATION = 50
const MAX_SPEED = 450
const JUMP_HEIGHT = -380
var Sprint = 1
var Gravity = 10
var wallPush = 525
var motion = Vector2() 
var gravityFlipped = 1
var canJump = true

func _physics_process(delta):
	movement()
	pass
	
func  movement():
	HorizontalMechanics()
	Engine.time_scale = 0.5
	motion.y += Gravity * gravityFlipped
	motion = move_and_slide(motion, FLOOR)
	pass
	
# Horizontal Mechanics controls everything to do with left and right inputs, as well as providing the direction of player 
# the jump mechanics function
func HorizontalMechanics():
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
	
		
	JumpMechanics(left)
	
# Jump Mechanics controls Jumping and Wall Jumping 
func JumpMechanics(left):
	# Check if player is on floor and play correct motion
	if is_on_floor():
		canJump = true
	if!is_on_floor():
		delayTimer(canJump)
	
	print(canJump)
	
	if canJump == true:
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT 
		
	
	#Wall Jumping
	elif is_on_wall() && is_on_floor() == false :
		$Sprite.play("WallHold")
		#Slows the effect of gravity on the player showing the player sliding down the wall
		motion.y = motion.y * 0.9 
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT 
			if left == true:
				motion.x = wallPush * 0.8
				yield (get_tree().create_timer(2), "timeout")	
			else:
				motion.x = -wallPush * 0.8 
				yield (get_tree().create_timer(2), "timeout")	
					
	else:
		if motion.y > 0:
			$Sprite.play("Jump")	
		else:
			$Sprite.play("Fall")
	if Input.is_action_just_released("ui_up") && motion.y < 0 :
		motion.y = 0
		# Fall Faster
	if Input.is_action_pressed("ui_down"):
		motion.y += 35
	
	


# Checks for when the player comes into contact with the arrows which than pushes the player upwards by making the gravity become negative
func _on_UpGravity_body_shape_entered(body_id, body, body_shape, area_shape):
	print(gravityFlipped)
	gravityFlipped = -0.5
	pass # Replace with function body.

# Restores gravity when the player exits the object
func _on_UpGravity_body_shape_exited(body_id, body, body_shape, area_shape):
	gravityFlipped = 1
	pass # Replace with function body.

func delayTimer(i):
	yield (get_tree().create_timer(0.2), "timeout")	
	i = false
	print("test")
