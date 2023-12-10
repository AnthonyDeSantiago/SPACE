extends CharacterBody2D
class_name Simple_Projectile
@export var SPEED = 300.0

@onready var direction = (get_global_mouse_position() - global_position).normalized()


func _physics_process(delta):
	velocity = direction * SPEED
	move_and_slide()
