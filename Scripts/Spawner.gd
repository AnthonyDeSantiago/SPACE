extends Node2D

@export var character: CharacterBody2D
@export var spawn_countdown: float = 5.0

@onready var enemies_array = get_meta("Enemies")
@onready var timer: Timer

func _enter_tree():
	timer = $Timer
	timer.wait_time = spawn_countdown

func _on_timer_timeout():
	spawn()

func spawn():
	print("spawn was called")
	var enemy = enemies_array[0].instantiate()
	enemy.global_position = global_position
	
	enemy.set_character_target(character)
	get_parent().add_child(enemy)
	
