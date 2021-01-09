extends KinematicBody2D


func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		print("Clicked")
