extends CharacterBody2D
class_name Bird
var gravity = 700
var jump_speed = -300
var rotate_speed = 2
var dead = false
@onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2.ZERO
	animation_player.play("idle")


func _physics_process(delta):
	if Input.is_action_just_pressed("jump") and !dead:
		if !Globals.isStarted:
			Globals.isStarted = true
			animation_player.play("fly")
		jump()
	if !Globals.isStarted:
		return
	velocity.y += gravity*delta

	move_and_collide(velocity*delta)
	rotate_bird()
	
	
func rotate_bird():
	if velocity.y <0 && rad_to_deg(rotation) > -30:
		rotation -= get_rotation_val()
	elif velocity.y > 0 && rad_to_deg(rotation) < 90:
		rotation += get_rotation_val()
		
		
func get_rotation_val():
	return rotate_speed * deg_to_rad(1)
	
func jump():
		velocity.y = jump_speed
		rotation = deg_to_rad(-30)
		
func death():
	dead = true
	Globals.isStarted = false
	animation_player.stop()
