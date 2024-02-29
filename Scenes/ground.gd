extends Node2D

var speed = 200
@onready var ground1 = $ground1/Sprite2D
@onready var ground2 = $ground2/Sprite2D
signal bird_dead
# Called when the node enters the scene tree for the first time.
func _ready():
	speed = 200
	ground1.global_position.x = 0
	ground2.global_position.x = ground1.global_position.x + ground1.texture.get_width()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !Globals.isStarted:
		return
	ground1.global_position.x -= speed*delta
	ground2.global_position.x -= speed*delta
	if ground1.global_position.x < -ground1.texture.get_width():
		ground1.global_position.x = ground2.global_position.x + ground2.texture.get_width()
	if ground2.global_position.x < -ground2.texture.get_width():
		ground2.global_position.x = ground1.global_position.x + ground1.texture.get_width()


func _on_ground_1_body_entered(body):
	process_bird_death(body)


func _on_ground_2_body_entered(body):
	process_bird_death(body)

func process_bird_death(body):
	bird_dead.emit()
	stop()
	
func stop():
	speed = 0
