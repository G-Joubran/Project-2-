extends CharacterBody3D

var original_rotation: Vector3
var shouldReturn: bool = false 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	original_rotation = rotation

func _process(delta: float) -> void:
	shouldReturn = true
	if Input.is_action_pressed("move_up"):
		rotation.z = rotation.z - 2 * delta
		shouldReturn = false
	if Input.is_action_pressed("move_down"):
		rotation.z = rotation.z + 2 * delta
		shouldReturn = false
	if Input.is_action_pressed("move_right"):
		rotation.x = rotation.x + 2 * delta
		shouldReturn = false
	if Input.is_action_pressed("move_left"):
		rotation.x = rotation.x - 2 * delta
		shouldReturn = false

	if shouldReturn:
		rotation = lerp(rotation, original_rotation, 4.5 * delta)
