extends CharacterBody2D


# BASIC MOVEMENT
var SPEED = 300.0
var JUMP_VELOCITY = -400.0
var movementSpeed = 3



func _physics_process(delta: float) -> void:
	rotate_player()
	_get_input();
	move_and_slide()
#Function is used to create diagonal movement
func _get_input():
	var  input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down");
	velocity = input_direction * SPEED;




func rotate_player(): #rotates player with mouse
	var direction = get_global_mouse_position()
	look_at(direction)


func _on_furniture_detected(area: Area2D) -> void:
	movementSpeed = 1

func _on_furniture_left(area: Area2D) -> void:
	movementSpeed = 3
