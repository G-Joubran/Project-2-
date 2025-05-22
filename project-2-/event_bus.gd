extends Node


signal playerHit
signal levelfinished

var levels = ["res://LEVEL1.tscn","res://LEVEL2.tscn","res://LEVEL3.tscn"]
var currentlevel = 0 

func _ready() -> void:
		levelfinished.connect(nextlevel)
	
func nextlevel():
	if currentlevel != 2:
		currentlevel += 1 
		get_tree().change_scene_to_file.bind(levels[currentlevel]).call_deferred()
	else:
		get_tree().change_scene_to_file.bind("res://mainmenu.tscn").call_deferred()
