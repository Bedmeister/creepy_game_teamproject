extends CharacterBody2D


# BASIC MOVEMENT
var SPEED = 300.0


#furniture push physics
var min_force = 15
var max_force = 100


func _physics_process(delta: float) -> void:
	rotate_player()
	slow_player()
	_get_input()
	move_and_slide()
	furniture_physics()

#Function is used to create diagonal movement
func _get_input():
	var  input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down");
	velocity = input_direction * SPEED




func rotate_player(): #rotates player with mouse
	var direction = get_global_mouse_position()
	look_at(direction)

func slow_player():
	if Input.is_action_pressed("pull"):
		SPEED = 75
	else: 
		SPEED = 300

func furniture_physics():
	for index in get_slide_collision_count():
		var collision = get_slide_collision(index)
		if collision.get_collider() is RigidBody2D:
			var rigidbody = collision.get_collider() as RigidBody2D
			var push_force = (15 * velocity.length() / SPEED) + min_force
			rigidbody.apply_central_impulse(-collision.get_normal() * .25) 
