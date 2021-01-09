extends Control

onready var label = $Label
var score = 0

func update_score():
	score += 10
	label.text = str(score)

func update_score_5():
	score += 5
	label.text = str(score)
