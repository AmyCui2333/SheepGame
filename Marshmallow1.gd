extends Area2D

var collided_check = 0
signal collided
signal scored

onready var marsh1_speed = get_parent().speed

var rng = RandomNumberGenerator.new()
func _ready():
	rng.randomize()
	position.y = rng.randi_range(10,45)
	var my_random_number = rng.randf_range(-10.0, 10.0)

func _process(delta):
	position.x -= marsh1_speed*delta

func _on_Marshmallow1_body_entered(body):
	if collided_check == 0:
		collided_check = 1
		var sound = get_parent().get_node("BaaPlayer")
		sound.play()
		emit_signal("scored")
		get_parent().inc_speed()
		self.visible = false
		get_parent().get_node("Timer").wait_time += rng.randf_range(-0.2,0.1)
		get_parent().get_node("Timer2").wait_time += rng.randf_range(-0.1,0.05)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
