extends KinematicBody2D

const FLOOR = Vector2(0, -1)
const ACCELERATION = 50
const MAX_SPEED = 450
const JUMP_HEIGHT = -325
var Sprint = 1
var Gravity = 10
var wallPush = 525
var motion = Vector2() 
var gravityFlipped = 1
var canJump = true
var canWallJump = true
var timer = null
var delayTime = 0.2
var canHoldWall = true
var delayTimeJump = 0.2
var isSprinting = null
var isInMotion = null
var canDash = false
var dashing = false
var dashDirection = Vector2(1,0)
var dashTime = 10


func _physics_process(delta):
	movement()
	if Input.is_action_just_pressed("Restart"):
		get_tree().reload_current_scene()
	pass
	
func  movement():
	HorizontalMechanics()

	motion.y += Gravity * gravityFlipped
	motion = move_and_slide(motion, FLOOR)
	pass
	
# Horizontal Mechanics controls everything to do with left and right inputs, as well as providing the direction of player 
# the jump mechanics function
func HorizontalMechanics():
	var left = false
	
	
	# Sprint Modifier -- "ui_sprint" is a custom input for SHIFT key
	if Input.is_action_just_pressed("ui_sprint"):
		Sprint = 1.4
		isSprinting = true
	if Input.is_action_just_released("ui_sprint"):
		Sprint = 1
		isSprinting = false

	#Motion Controls
	if Input.is_action_pressed("ui_right"):		
		motion.x = min(motion.x + ACCELERATION , MAX_SPEED * Sprint)
		$Sprite.flip_h = false # $allows access to function of $x x class
		left = false
		$Sprite.play("Run")
		isInMotion = true
	elif Input.is_action_pressed("ui_left") :
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED * Sprint)
		$Sprite.flip_h = true
		left = true
		$Sprite.play("Run")
		isInMotion = true
	else:
		motion.x = 0	
		$Sprite.play("Idle")	
		isInMotion = false
	
		if(isSprinting == true):
			$Sprite.speed_scale = 1.4 #Speed_Scale refers to animation speed in order to match speed when the player sprints
		else:
			$Sprite.speed_scale = 1
			
	if (isInMotion && isSprinting && is_on_floor()):
		$SFX/Walking.stop()
		if ($SFX/Sprinting.is_playing() == false):		
			$SFX/Sprinting.play()

	elif (isInMotion && is_on_floor()):
		$SFX/Sprinting.stop()
		if ($SFX/Walking.is_playing() == false):	
			$SFX/Walking.play()
	else:
		$SFX/Sprinting.stop()
		$SFX/Walking.stop()
	
	JumpMechanics(left)
	particleController(left)
	
# Jump Mechanics controls Jumping and Wall Jumping 
func JumpMechanics(left):
	# Check if player is on floor and play correct motion
	if is_on_floor():
		canJump = true
	else: #Coyote Timer
		delayTimer(delayTimeJump, "onTimeoutCompleteJump") 
	if is_on_wall() && !is_on_floor():
		canWallJump = true
	else: 
		delayTimer(delayTimeJump, "onTimeoutCompleteWallJump")

	if is_on_ceiling():
		$Sprite.flip_v = true
	else:
		$Sprite.flip_v = false
	
	if Input.is_action_pressed("ui_up"):
		if canJump == true:
			if($SFX/Jumping.playing == false):
				$SFX/Jumping.play()
			motion.y = JUMP_HEIGHT 
		 
	#Wall Jumping
	if canWallJump == true:
		$Sprite.play("WallHold")
		#Slows the effect of gravity on the player showing the player sliding down the wall
		motion.y = motion.y * 0.9 
		if Input.is_action_just_pressed("ui_up"):
			if($SFX/Jumping.playing == false):
				$SFX/Jumping.play()
			motion.y = JUMP_HEIGHT * 1.5
			if left == true:
				motion.x = wallPush * 1.3
			else:
				motion.x = -wallPush * 1.3
	else:
		if motion.y > 0:
			$Sprite.play("Jump")	
		elif motion.y <0 :
			$Sprite.play("Fall")
	if Input.is_action_just_released("ui_up") && motion.y < 0 :
		motion.y = 0

	if motion.y == 0 && motion.x == 0:
		$Sprite.play("Idle")
	
func particleController(left):
	var moveParticle = $ParticleMove
	var airParticle = $ParticleInAir
	
	if abs(motion.x) > 0:
		moveParticle.emitting = true
	else:
		moveParticle.emitting = false
	if abs(motion.y) > 0 && !is_on_floor() && !is_on_ceiling():
		airParticle.emitting = true
	else:
		airParticle.emitting = false
	
	if left == true:
		moveParticle.scale.x = 1
	else:
		moveParticle.scale.x = -1

#Create a timer than on timeout calls onTimeoutCompleteJump()
func delayTimer(timeToWait, functionName):
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(timeToWait)
	timer.connect("timeout", self, functionName)
	add_child(timer)
	timer.start()
	return  

func onTimeoutCompleteJump():
	canJump = false

func onTimeoutCompleteWallJump():
	canWallJump = false

	
func next_to_wall():
	return next_to_left_wall() or next_to_right_wall()
	
func next_to_left_wall():
	return $Raycasts/LeftRay1.is_colliding() or $Raycasts/LeftRay2.is_colliding()

func next_to_right_wall():
	return $Raycasts/RightRay1.is_colliding() or $Raycasts/RightRay2.is_colliding()

func _on_Area2D_body_shape_entered(body_id, body, body_shape, area_shape):
	get_tree().reload_current_scene()
	pass # Replace with function body.

func _on_UpGravity_body_entered(body):
	if body.get_name() == "Player":
		gravityFlipped = -2.5
	pass # Replace with function body.

func _on_UpGravity_body_exited(body):
	gravityFlipped = 1
	pass # Replace with function body.


