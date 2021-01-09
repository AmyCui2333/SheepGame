extends KinematicBody2D


const GRAVITY = 5
const JUMP_SPEED = -150
const RESTART = preload("res://Restart.tscn")
const BUTTON = preload("res://Button.tscn")

var velocity = Vector2.ZERO
var flying = -1
signal update_hearts
signal dead
signal restart
onready var animation = $AnimatedSprite
onready var health = 3
onready var timer = get_parent().get_node("FlyTimer")

func _ready():
	self.connect("update_hearts",get_parent().get_node("HeartUI"), "_update_health")
	
func _process(delta):
	if flying == -1:
		velocity.y += GRAVITY
		
		if Input.is_action_just_pressed("ui_up") and is_on_floor():
			velocity.y = JUMP_SPEED
		move_and_slide(velocity, Vector2.UP)
		play_animation()
	else:
		if position.y > 10:
			velocity.y -= GRAVITY
		else:
			velocity.y = 0
		
		if Input.is_action_pressed("ui_down"):
			velocity.y = -JUMP_SPEED/3
		move_and_slide(velocity, Vector2.DOWN)
		play_animation()
	

func _lose_health():
	health -= 1
	emit_signal("update_hearts",health)
	
	
func play_animation():
	var move = "sheepMove"
	var jump = "jumpUp"
	var fall = "fallDown"
	if health > 0:	
		if velocity.y < 0:
			animation.play(str(health)+jump)
		elif velocity.y > 0 and is_on_floor():
			animation.play(str(health)+move)
		else:
			animation.play(str(health)+fall)
	else:
		animation.play("dead")
		var restart = BUTTON.instance()
		get_parent().add_child(restart)
		get_tree().paused = true
		
func hit_eagle():
	flying = -1	
	_lose_health()
	
func start_flying():
	flying = 1
	timer.start()

func _on_FlyTimer_timeout():
	flying = -1
