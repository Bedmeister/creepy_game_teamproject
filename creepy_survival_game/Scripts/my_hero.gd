extends CharacterBody2D


# BASIC MOVEMENT
var SPEED = 300.0
var JUMP_VELOCITY = -400.0
var movementSpeed = 3


func _physics_process(delta: float) -> void:
	rotate_player()
	
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



func rotate_player(): #rotates player with mouse
	var direction = get_global_mouse_position()
	look_at(direction)


func _on_furniture_detected(area: Area2D) -> void:
	movementSpeed = 1

func _on_furniture_left(area: Area2D) -> void:
	movementSpeed = 3
