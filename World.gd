extends Node2D

const OBSTACLE= preload("res://Obs1.tscn")
const MARSHMALLOW= preload("res://Marshmallow1.tscn")
#onready var restart = $Restart

var speed = 50

#func _ready():
#	restart.visible = false

func get_speed():
	return speed

func inc_speed():
	speed+= 10

func _on_Timer_timeout():
	var obstacle= OBSTACLE.instance()
	add_child(obstacle)
	obstacle.connect("collided", $Player, "_lose_health")

func _on_Timer2_timeout():
	var marshmallow= MARSHMALLOW.instance()
	add_child(marshmallow)
	marshmallow.connect("collided", $Player, "_increase speed")
	marshmallow.connect("scored", $Control, "update_score")

