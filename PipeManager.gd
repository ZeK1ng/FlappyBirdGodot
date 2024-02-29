extends Node2D

class_name PipeManager
	
var pipe_scene = preload("res://Scenes/pipes.tscn")

var pipe_speed = -200
@onready var timer = $SpawnTimer
signal bird_crashed
signal scored

func _ready():
	timer.timeout.connect(spawn_pipes)
	timer.start(1)
	
func spawn_pipes():
	var pipe = pipe_scene.instantiate() as Pipes
	add_child(pipe)
	var viewport = get_viewport().get_camera_2d().get_viewport_rect()
	pipe.position.x = viewport.end.x
	pipe.position.y = randf_range(viewport.size.y*0.2 - viewport.size.y/2, viewport.size.y*0.7-viewport.size.y/2)
	pipe.set_speed(pipe_speed)
	pipe.bird_crashed.connect(on_bird_crashed)
	pipe.scored.connect(on_scored)

func on_scored():
	Globals.score = Globals.score + 1	
	scored.emit()
	
func on_bird_crashed():
	timer.stop()
	bird_crashed.emit()
	var children = get_children().filter(func (child): return child is Pipes)
	for pipe in children:
		(pipe as Pipes).set_speed(0)
	
