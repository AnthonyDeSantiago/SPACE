extends Node2D

@export var character: CharacterBody2D

@onready var enemies_array = get_meta("Enemies")

func _on_timer_timeout():
	spawn()

func spawn():
	print("spawn was called")
	var enemy: Enemy_Mob = enemies_array[0].instantiate()
	enemy.global_position = global_position
	
	enemy.set_character_target(character)
	get_parent().add_child(enemy)
	
