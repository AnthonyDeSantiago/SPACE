extends CharacterBody2D
class_name enemy

@export var speed = 400
@export var accel = 7
@export var damage = 10

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var target_body: CharacterBody2D
@onready var nav: NavigationAgent2D = $NavigationAgent2D
@onready var direction: Vector2

func enemy_set_target(target: CharacterBody2D):
	$Component_Enemy_Rotation.target_body = target
	target_body = target

func _physics_process(delta):
	anim.play("run")
	if target_body == null:
		print("Enemy has no player reference!")
		pass
	else:
		nav.target_position = target_body.position
		direction = (nav.get_next_path_position() - global_position).normalized()
		velocity = velocity.lerp(direction * speed, accel * delta)
		move_and_slide()

