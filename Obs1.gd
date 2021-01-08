extends Area2D

var collided_check = 0
signal collided

func _process(delta):
	position.x-= 50*delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	
func _on_Obs1_body_entered(body):
	if collided_check == 0:
		emit_signal("collided")
		collided_check = 1

