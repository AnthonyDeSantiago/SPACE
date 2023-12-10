extends CharacterBody2D
class_name Simple_Projectile
@export var SPEED = 300.0

@onready var direction = (get_global_mouse_position() - global_position).normalized()


func _physics_process(delta):
	velocity = direction * SPEED
	move_and_slide()


func _on_area_2d_body_entered(body):
	if body.has_node("Marker2D"):
		print("Hit with Marker2D")
		queue_free()
	queue_free()
