extends Node2D

#hello


func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/anthony_level.tscn")


func _on_texture_button_2_pressed():
	get_tree().quit()


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/anthony_level.tscn")
