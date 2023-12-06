extends CharacterBody2D

@export var speed = 400
@export var health = 100

@onready var target = position
@onready var anim = get_node("Marker2D/AnimatedSprite2D")

func _physics_process(delta):
	anim.play("run")
	target = get_global_mouse_position()
	velocity = position.direction_to(target) * speed
	# look_at(target)
	if position.distance_to(target) > 10:
		move_and_slide()
