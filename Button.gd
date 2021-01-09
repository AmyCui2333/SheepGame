extends Button

func _input(event):
	if visible == true and event is InputEventMouseButton and event.is_pressed():
		get_tree().paused = false
		get_tree().change_scene("res://World.tscn")
