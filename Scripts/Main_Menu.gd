extends Node2D

#hello

@onready var score_text_number: Label = $HighscoreNumber
#@onready var highscore = Global.highscore

func _ready():
	score_text_number.text = str(Global.highscore)
	


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/anthony_level.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
