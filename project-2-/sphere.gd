extends RigidBody3D

var lives = 3
var startPosition = position
var original_position: Vector3
var fell = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startPosition = position
	updateUI()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.y < - 4:
		fell = true
		print("He dead")
		die()
		updateUI()
	
func die():
	if Playerstats.lives > 1:
		Playerstats.lives -= 1
		respawn()
		updateUI()
	else:
		Playerstats.lives -=1
		get_tree().change_scene_to_file.bind("res://endgame.tscn").call_deferred()
		updateUI()
func respawn():
	position = startPosition
	linear_velocity = Vector3.ZERO
	angular_velocity = Vector3.ZERO
	updateUI()

func updateUI():
	$CanvasLayer/Control/Label.text = "Lives: " + str(Playerstats.lives)
