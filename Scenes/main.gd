extends Node2D
@onready var bird = $Bird

@onready var ui = $UI
@onready var pipe_manager = $PipeManager
func _process(delta):
	if Input.is_action_pressed("reload") && !Globals.isStarted:
		Globals.score = 0
		get_tree().reload_current_scene()


func _on_pipe_manager_bird_crashed():
	ui.show_gameOver()
	bird.death()
	

func _on_pipe_manager_scored():
	ui.update_points(Globals.score) # Replace with function body.


func _on_ground_bird_dead():
	pipe_manager.on_bird_crashed()
