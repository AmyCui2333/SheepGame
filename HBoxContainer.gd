extends HBoxContainer


func _update_health(value):
	for i in range(get_child_count()):
		get_child(i).visible = i < value
