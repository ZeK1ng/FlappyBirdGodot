extends Node2D

class_name Pipes

var speed=0
signal bird_crashed
signal scored
func set_speed(_speed):
	speed = _speed


func _process(delta):
	position.x += speed * delta
	
func _pipe_entered(_body):
	bird_crashed.emit()

func _on_score_area_body_entered(body):
	scored.emit()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free() # Replace with function body.
