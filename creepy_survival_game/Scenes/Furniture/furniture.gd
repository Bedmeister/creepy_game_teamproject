extends RigidBody2D

@export var pull_marker: Marker2D
var pullable = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if pullable:
		if Input.is_action_pressed("pull"):
			move_and_collide(pull_marker.global_position - global_position)


func _on_resistance_area_entered(area: Area2D) -> void:
	if area.is_in_group("puller"):
		pullable = true
	else:
		pullable = false


func _on_resistance_area_exited(area: Area2D) -> void:
	if area.is_in_group("Puller"):
		pullable = false
