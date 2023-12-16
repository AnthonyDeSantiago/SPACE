extends Node2D

@export var enemy_kill_value = 5

@onready var score_number = 0
@onready var score_text_number: Label = $CanvasLayer/Score/Score_Number
@onready var health_bar: TextureProgressBar = $"CanvasLayer/HUD/Health Bar"
@onready var game_over_screen: CanvasLayer = $Game_Over_Screen

func _on_child_entered_tree(node):
	if node is enemy:
		node.enemy_set_target($simple_char)


func _on_child_exiting_tree(node):
	if node is enemy:
		score_number += enemy_kill_value
		score_text_number.text = str(score_number)


func _on_simple_char_player_was_hurt(damage):
	health_bar.value -= damage
	if health_bar.value <= 0:
		game_over_screen.visible = true
		get_tree().paused = true





func _on_play_again_button_pressed():
	print("Play again pressed")
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/anthony_level.tscn")
