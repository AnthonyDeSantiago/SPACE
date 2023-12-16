extends CharacterBody2D


@export var SPEED = 500.0

@onready var projectile_scene = preload("res://Scenes/simple_proj.tscn")
@onready var proj_spawner = $Marker2D/Proj_Spawner
@onready var anim = $Marker2D/AnimatedSprite2D
@onready var area: Area2D = $Area2D
@onready var timer_invulnerability: Timer = $Timer
@onready var is_invulnerable = false

signal player_was_hurt(damage)

signal player_regen()

func _physics_process(delta):
	
	#anim.play("run")
	var vertical = Input.get_axis("up", "down")
	var horizontal = Input.get_axis("left", "right")
	
	if vertical:
		velocity.y = vertical * SPEED
		anim.play("run")
	else:
		velocity.y = 0
		if horizontal == 0:
			anim.stop()
		
	if horizontal:
		velocity.x = horizontal * SPEED
		anim.play("run")
	else:
		velocity.x = 0
		if vertical == 0:
			anim.stop()
	move_and_slide()
	  
func _input(event):
	if event.is_action_pressed("click"):
		var new_projectile: CharacterBody2D = projectile_scene.instantiate()
		
		print(new_projectile.position)
		new_projectile.global_position = proj_spawner.global_position
		get_parent().add_child(new_projectile)
		
	if event.is_action_pressed("rightclick"):
		player_regen.emit()


func _on_area_2d_body_entered(body):
	if body is enemy and area.monitorable:
		player_was_hurt.emit(body.damage)
		area.set_deferred("monitoring", false)
		timer_invulnerability.start()
		


func _on_invulnerability_timeout():
	area.set_deferred("monitoring", true)
