extends CharacterBody2D

@export var sprint_speed: float = 250.0  # player speed

@onready var camera = $Camera2D  

func _process(delta):
	rotate_towards_mouse()

func _physics_process(delta):
	move_player()

func rotate_towards_mouse():
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)  # mouse direction

func move_player():
	var direction = Vector2.ZERO

	if Input.is_action_pressed("move_forward"):
		direction += Vector2.UP
	if Input.is_action_pressed("move_backward"):
		direction += Vector2.DOWN
	if Input.is_action_pressed("move_left"):
		direction += Vector2.LEFT
	if Input.is_action_pressed("move_right"):
		direction += Vector2.RIGHT

	direction = direction.normalized()

	velocity = direction * sprint_speed
	move_and_slide()
