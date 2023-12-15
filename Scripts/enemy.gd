extends CharacterBody2D
class_name enemy

@export var speed = 400
@export var accel = 7

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var target_body: CharacterBody2D
@onready var target: Vector2
@onready var nav: NavigationAgent2D = $NavigationAgent2D
@onready var direction: Vector2

func enemy_set_target(target: CharacterBody2D):
	$Component_Enemy_Rotation.target_body = target
	target_body = target
	print("enemy has target")

func _physics_process(delta):
	anim.play("run")
	if target_body == null:
		print("Enemy has no player reference!")
		pass
	else:
		print("Things are running")
		target = target_body.position
		nav.target_position = target
		direction = (nav.get_next_path_position() - global_position).normalized()
		velocity = velocity.lerp(direction * speed, accel * delta)
		move_and_slide()

