extends Node2D

const OBSTACLE= preload("res://Obs1.tscn")

func _on_Timer_timeout():
	var obstacle= OBSTACLE.instance()
	add_child(obstacle)
