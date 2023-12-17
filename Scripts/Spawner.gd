extends Node2D
class_name Spawner

@export var character: CharacterBody2D
@export var spawn_countdown: float = 5.0

@onready var enemies_array = get_meta("Enemies")
@onready var timer: Timer

func _enter_tree():
	timer = $Timer
	timer.wait_time = spawn_countdown

func spawn(speed):
	var enemy_mob: enemy = enemies_array[0].instantiate()
	enemy_mob.global_position = global_position
	enemy_mob.speed = speed
	
	#enemy.set_character_target(character)
	get_parent().add_child(enemy_mob)
	
