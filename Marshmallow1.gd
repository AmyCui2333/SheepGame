extends Area2D

var collided_check = 0
signal collided
signal scored

onready var marsh1_speed = get_parent().speed

var rng = RandomNumberGenerator.new()
func _ready():
	rng.randomize()
	var my_random_number = rng.randf_range(-10.0, 10.0)

func _process(delta):
	position.x -= marsh1_speed*delta

func _on_Marshmallow1_body_entered(body):
	if collided_check == 0:
		collided_check = 1
		emit_signal("scored")
		print("signal emitted")
		get_parent().inc_speed()
		self.visible = false
		get_parent().get_node("Timer").wait_time += rng.randf_range(-0.1,0.05)
		get_parent().get_node("Timer2").wait_time += rng.randf_range(-0.1,0.05)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
