extends Node2D

@export var enemy_kill_value = 10
@export var enemy_speed = 250
@export var enemy_speed_cap = 475
@export var spawn_start_freq = 5
@export var spawn_accel = .95
@export var temp_dec = 10


@export var gen_breakdown_time = 30

@onready var score_number = 0
@onready var score_text_number: Label = $CanvasLayer/Score/Score_Number
@onready var health_bar: TextureProgressBar = $"CanvasLayer/HUD/Health Bar"
@onready var game_over_screen: CanvasLayer = $Game_Over_Screen
@onready var spawner_array := []
@onready var generator_array := []
@onready var generator_timer: Timer = $Generator_Timer
@onready var anim = $CanvasLayer/HUD/AnimatedSprite2D
@onready var temp_bar = $CanvasLayer/Temperature/TextureProgressBar
@onready var temp_dec_timer = $Temp_Decrement_Timer


func _ready():
	$Spawn_Timer.wait_time = spawn_start_freq
	$Spawn_Timer.start()
	generator_timer.wait_time = gen_breakdown_time
	generator_timer.start()
	
	for child in get_tree().get_nodes_in_group("spawner_group"):
		spawner_array.append(child)
		
	for child in get_tree().get_nodes_in_group("generator_group"):
		if child is generator:
			child.connect("generator_has_been_fixed", _on_generator_fixed)
		generator_array.append(child)
		
		

func _on_child_entered_tree(node):
	if node is enemy:
		node.enemy_set_target($simple_char)
		
	if node is Red_Projectile:
		node.connect("player_regen", _on_simple_char_player_regen)


func _on_child_exiting_tree(node):
	if node is enemy:
		score_number += enemy_kill_value
		score_text_number.text = str(score_number)


func _on_simple_char_player_was_hurt(damage):
	health_bar.value -= damage
	$simple_char/PlayerHit.play()
	if health_bar.value <= 0:
		if score_number > Global.highscore:
			Global.highscore = score_number
		game_over_screen.visible = true
		get_tree().paused = true
		$Big_Arrow_Canvas.visible = false

func _on_play_again_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/anthony_level.tscn")


func _on_main_menu_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/Main_Menu.tscn")


func _on_spawn_timer_timeout():
	spawner_array.pick_random().spawn(enemy_speed)
	if enemy_speed < enemy_speed_cap:
		enemy_speed += 5
	if $Spawn_Timer.wait_time >= .5:
		$Spawn_Timer.wait_time = $Spawn_Timer.wait_time * spawn_accel
	


func _on_simple_char_player_regen():
	health_bar.value += 20
	score_number += 15
	
	

func _on_simple_char_player_cooldown():
	$CanvasLayer/HUD/AnimatedSprite2D.visible = true
	anim.play("default")
	


func _on_simple_char_player_cooldown_over():
	anim.stop()
	$CanvasLayer/HUD/AnimatedSprite2D.visible = false
	


func _on_generator_timer_timeout():
	print("break generator")
	generator_timer.stop()
	temp_dec_timer.start()
	var gen: generator = generator_array.pick_random()
	gen.break_generator()
	$simple_char.broken_gen = gen

func _on_generator_fixed():
	$simple_char/Generator.play()
	score_number += 20
	score_text_number.text = str(score_number)
	generator_timer.start()
	temp_dec_timer.stop()
	temp_bar.value = 100
	$simple_char.broken_gen = null


func _on_temp_decrement_timer_timeout():
	temp_bar.value -= temp_dec
	if temp_bar.value <= 0:
		if score_number > Global.highscore:
			Global.highscore = score_number
		game_over_screen.visible = true
		get_tree().paused = true
		$Big_Arrow_Canvas.visible = false
