extends Area2D

var collided_check = 0
signal collided

onready var eagle_speed = get_parent().speed*1.6
	
func _process(delta):
	position.x -= eagle_speed*delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	
func _on_Eagle_body_entered(body):
	if collided_check == 0:
		emit_signal("collided")
		collided_check = 1
