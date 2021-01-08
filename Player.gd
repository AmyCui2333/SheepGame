extends KinematicBody2D


const GRAVITY = 4.2
const JUMP_SPEED = -150
var velocity = Vector2.ZERO
onready var animation = $AnimatedSprite


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	velocity.y += GRAVITY
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_SPEED
		
	if velocity.y<0:
		animation.play("jumpUp")
	elif velocity.y>0 and is_on_floor():
		animation.play("sheepMove")
	else:
		animation.play("fallDown")
	move_and_slide(velocity, Vector2.UP)
