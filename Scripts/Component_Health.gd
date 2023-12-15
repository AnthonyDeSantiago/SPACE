extends Node2D

@export var health = 100

	
func take_damage(damage:float):
	get_parent().queue_free()
