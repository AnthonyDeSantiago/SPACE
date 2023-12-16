extends Node2D


func _on_quit_button_pressed():
	get_tree().quit()

#hello


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/anthony_level.tscn")


func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/anthony_level.tscn")


func _on_texture_button_2_pressed():
	get_tree().quit()
