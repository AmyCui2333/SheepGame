extends KinematicBody2D


const GRAVITY = 4.2
const JUMP_SPEED = -150
var velocity = Vector2.ZERO
signal update_hearts
onready var animation = $AnimatedSprite
onready var health = 3

func _ready():
	self.connect("update_hearts",get_parent().get_node("HeartUI"), "_update_health")

func _process(delta):
	velocity.y += GRAVITY
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_SPEED
	
	play_animation()
	
	move_and_slide(velocity, Vector2.UP)

func _lose_health():
	health -= 1
	emit_signal("update_hearts",health)
	print("signal emitted")
	if health == 0:
		get_tree().quit()
	
func play_animation():
	var move = "sheepMove"
	var jump = "jumpUp"
	var fall = "fallDown"
	if health > 0:	
		if velocity.y<0:
			animation.play(str(health)+jump)
		elif velocity.y>0 and is_on_floor():
			animation.play(str(health)+move)
		else:
			animation.play(str(health)+fall)
	
