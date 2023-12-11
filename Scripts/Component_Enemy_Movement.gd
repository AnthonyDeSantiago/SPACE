extends CharacterBody2D
class_name Enemy_Mob

@export var speed = 400
@export var health = 100
@export var character_target: CharacterBody2D

@onready var target = position
@onready var anim = get_node("Marker2D/AnimatedSprite2D")
@onready var marker: Marker2D = get_node("Marker2D")

func _physics_process(delta):
	anim.play("run")
	if character_target == null:
		print("It is null!")
	else:
		target = character_target.position
		marker.look_at(target)
		velocity = position.direction_to(target) * speed
		if position.distance_to(target) > 10:
			move_and_slide()

func set_character_target(target: CharacterBody2D) -> void:
	print("Set_Character_Target was called!")
	character_target = target
