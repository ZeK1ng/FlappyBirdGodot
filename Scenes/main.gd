extends Node2D

func _process(delta):
	if Input.is_action_pressed("reload") && !Globals.isStarted:
		get_tree().reload_current_scene()
