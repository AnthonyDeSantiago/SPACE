extends Node2D

@export var enemy_kill_value = 5

@onready var score_number = 0
@onready var score_text_number: Label = $CanvasLayer/Score/Score_Number

func _on_child_entered_tree(node):
	if node is enemy:
		node.enemy_set_target($simple_char)


func _on_child_exiting_tree(node):
	if node is enemy:
		score_number += enemy_kill_value
		score_text_number.text = str(score_number)
