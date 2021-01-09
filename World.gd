extends Node2D

const OBSTACLE= preload("res://Obs1.tscn")
const MARSHMALLOW= preload("res://Marshmallow1.tscn")
const EAGLE = preload("res://Eagle.tscn")
const BALLOON = preload("res://Balloon.tscn")

var speed = 50

func get_speed():
	return speed

func inc_speed():
	speed += 10

func _on_Timer_timeout():
	var obstacle= OBSTACLE.instance()
	add_child(obstacle)
	obstacle.connect("collided", $Player, "_lose_health")
	
func _on_Timer2_timeout():
	var marshmallow= MARSHMALLOW.instance()
	add_child(marshmallow)
	marshmallow.connect("collided", $Player, "_increase speed")
	marshmallow.connect("scored", $Control, "update_score")

func _on_Timer3_timeout():
	if $Player.flying == 1:
		var eagle = EAGLE.instance()
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		$Timer3.wait_time = rng.randf_range(2.0,5.0)
		add_child(eagle)
		eagle.connect("collided",$Player, "hit_eagle")

func _on_BalloonTimer_timeout():
	if $Player.flying == -1:
		var balloon = BALLOON.instance()
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		var p = rng.randi_range(1,20)
		if p <=5 :
			add_child(balloon)
			balloon.connect("collided",$Player, "start_flying")
