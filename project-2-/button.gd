extends Button



func _on_pressed() -> void:
	get_tree().change_scene_to_file.bind("res://LEVEL1.tscn").call_deferred()
