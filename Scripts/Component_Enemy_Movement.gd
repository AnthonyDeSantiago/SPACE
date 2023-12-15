extends CharacterBody2D

@export var speed = 400
@export var health = 100
@export var target_body: CharacterBody2D

@onready var target = position

func _physics_process(delta):
	if target_body == null:
		#print("Enemy has no player reference!")
		pass
	else:
		target = target_body.position
		velocity = position.direction_to(target) * speed
		if position.distance_to(target) > 10:
			move_and_slide()

func set_character_target(target: CharacterBody2D) -> void:
	print("Set_Character_Target was called!")
	target_body = target
