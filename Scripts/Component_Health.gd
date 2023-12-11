extends Node2D

@export var health = 100
@onready var healthBar: TextureProgressBar = $TextureProgressBar

	
func take_damage(damage:float):
	health -= damage
	healthBar.value = health
	if health <= 0:
		get_parent().queue_free()
