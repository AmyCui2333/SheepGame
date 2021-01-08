extends Area2D

var collided_check = 0

func _process(delta):
	position.x-= 50*delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Obs1_body_entered(body):
	if collided_check == 0:
		print(collided_check)
		#if World.Player.life == 0:
		#	get_tree().quit()
		collided_check = 1
		print(collided_check)
		#World.Player.life -= 1
