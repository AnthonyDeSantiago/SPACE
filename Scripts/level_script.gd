extends Node2D

@export var enemy_kill_value = 5
@export var enemy_speed = 250
@export var spawn_start_freq = 5
@export var spawn_accel = .95

@onready var score_number = 0
@onready var score_text_number: Label = $CanvasLayer/Score/Score_Number
@onready var health_bar: TextureProgressBar = $"CanvasLayer/HUD/Health Bar"
@onready var game_over_screen: CanvasLayer = $Game_Over_Screen
@onready var spawner_array := []


func _ready():
	$Spawn_Timer.wait_time = spawn_start_freq
	$Spawn_Timer.start()
	for child in get_tree().get_nodes_in_group("spawner_group"):
		spawner_array.append(child)
		print(spawner_array)

func _on_child_entered_tree(node):
	if node is enemy:
		node.enemy_set_target($simple_char)


func _on_child_exiting_tree(node):
	if node is enemy:
		score_number += enemy_kill_value
		score_text_number.text = str(score_number)


func _on_simple_char_player_was_hurt(damage):
	health_bar.value -= damage
	$simple_char/PlayerHit.play()
	if health_bar.value <= 0:
		game_over_screen.visible = true
		get_tree().paused = true


func _on_play_again_button_pressed():
	print("Play again pressed")
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/anthony_level.tscn")


func _on_main_menu_button_pressed():
	print("Main Menu pressed")
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/Main_Menu.tscn")


func _on_spawn_timer_timeout():
	print("spawn")
	if enemy_speed < 1000:
		spawner_array.pick_random().spawn(enemy_speed)
		enemy_speed += 5
	if $Spawn_Timer.wait_time >= .5:
		$Spawn_Timer.wait_time = $Spawn_Timer.wait_time * spawn_accel
	


func _on_simple_char_player_regen():
	health_bar.value += 25
