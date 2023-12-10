extends CharacterBody2D

@export var speed = 400
@export var health = 100
@export var character_target: CharacterBody2D

@onready var target = position
@onready var anim = get_node("Marker2D/AnimatedSprite2D")
@onready var marker: Marker2D = get_node("Marker2D")

func _physics_process(delta):
	anim.play("run")
	target = character_target.position
	marker.look_at(target)
	velocity = position.direction_to(target) * speed
	# look_at(target)
	if position.distance_to(target) > 10:
		move_and_slide()
