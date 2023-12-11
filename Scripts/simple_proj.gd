extends CharacterBody2D
class_name Simple_Projectile
@export var SPEED = 600.0
@export var damage = 25

@onready var direction = (get_global_mouse_position() - global_position).normalized()


func _physics_process(delta):
	velocity = direction * SPEED
	move_and_slide()


func _on_area_2d_body_entered(body):
	if body.has_node("Component_Health"):
		var component_health = body.get_node("Component_Health")
		print("Hit with component_health")
		component_health.take_damage(damage)
		queue_free()
	queue_free()
