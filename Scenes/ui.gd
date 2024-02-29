extends CanvasLayer

@onready var game_over = $MarginContainer/GameOver
@onready var points_lbl = $MarginContainer/Points
func _ready():
	points_lbl.text = "%d " % 0

func update_points(points: int):
	print(points)
	points_lbl.text = "%d " % points
	
func show_gameOver():
	game_over.visible = true
