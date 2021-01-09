extends Area2D

var collided_check = 0
signal collided

onready var balloon_speed = get_parent().speed
	
func _process(delta):
	position.x -= balloon_speed*delta
	
func _on_Balloon_body_entered(body):
	if collided_check == 0:
		emit_signal("collided")
		collided_check = 1
		queue_free()

