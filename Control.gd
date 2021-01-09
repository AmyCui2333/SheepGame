extends Control

onready var label = $Label
var score = 0

func update_score():
	score += 10
	label.text = "Score: "+str(score)
