extends KinematicBody2D


const GRAVITY = 4.2
const JUMP_SPEED = -150
var velocity = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	velocity.y += GRAVITY
	
	if Input.is_action_just_pressed("ui_up"):
		velocity.y = JUMP_SPEED

	move_and_slide(velocity)
