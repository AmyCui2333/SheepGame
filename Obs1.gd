extends Area2D

var collided_check = 0
signal collided
signal scored

onready var obs1_speed = get_parent().speed

func _process(delta):
	position.x-= obs1_speed*delta
	if position.x < get_parent().get_node("Player").position.x && collided_check == 0:
		emit_signal("scored")
		collided_check = 1

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	
func _on_Obs1_body_entered(body):
	if collided_check == 0:
		emit_signal("collided")
		var sci = get_parent().get_node("scissor")
		sci.play()
		collided_check = 1
