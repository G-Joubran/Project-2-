extends StaticBody3D



func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is RigidBody3D:
		EventBus.levelfinished.emit()
