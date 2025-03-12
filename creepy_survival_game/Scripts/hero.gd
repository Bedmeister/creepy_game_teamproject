extends CharacterBody2D


# BASIC MOVEMENT
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const movementSpeed = 6


func _physics_process(delta: float) -> void:
	# Add the gravity.
	var velocity = Vector2 (0,0);
	# using movement 
	if Input.is_action_pressed ("ui_right"):
		velocity += Vector2.RIGHT * movementSpeed
	
	elif Input.is_action_pressed("ui_left"):
			velocity += Vector2.LEFT * movementSpeed
	elif Input.is_action_pressed("ui_up"):
			velocity += Vector2.UP * movementSpeed
	elif Input.is_action_pressed("ui_down"):
			velocity += Vector2.DOWN * movementSpeed
			
	position += velocity.normalized() * movementSpeed
