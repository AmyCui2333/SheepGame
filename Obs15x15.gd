extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	position.x-= 50*delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
