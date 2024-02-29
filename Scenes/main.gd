extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Ground.global_position.x = 0
	print($background.global_position.x)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
