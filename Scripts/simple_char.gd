extends CharacterBody2D


@export var SPEED = 500.0

@onready var projectile_scene = preload("res://Scenes/simple_proj.tscn")
@onready var projectile_scene2 = preload("res://Scenes/red_proj.tscn")
@onready var proj_spawner = $Marker2D/Proj_Spawner
@onready var anim = $Marker2D/AnimatedSprite2D
@onready var area: Area2D = $Area2D
@onready var timer_invulnerability: Timer = $Timer
@onready var is_invulnerable = false
@onready var interactable: generator
@onready var broken_gen: generator

signal player_was_hurt(damage)

signal player_regen()

signal player_cooldown()

signal player_cooldown_over()

var shot_ready = true

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
		$GunFired.play()
		var new_projectile: CharacterBody2D = projectile_scene.instantiate()
		
		print(new_projectile.position)
		new_projectile.global_position = proj_spawner.global_position
		get_parent().add_child(new_projectile)
		
	if event.is_action_pressed("rightclick"):
		if shot_ready == true:
			player_cooldown.emit()
			$BigFired.play()
			var new_projectile: CharacterBody2D = projectile_scene2.instantiate()
			
			print(new_projectile.position)
			new_projectile.global_position = proj_spawner.global_position
			get_parent().add_child(new_projectile)
			shot_ready = false
			$AltFire.start()
	
	if event.is_action_pressed("Interact") and interactable != null:
		interactable.fix_generator()


func _on_area_2d_body_entered(body):
	if body is enemy and area.monitorable:
		player_was_hurt.emit(body.damage)
		area.set_deferred("monitoring", false)
		timer_invulnerability.start()
		


func _on_invulnerability_timeout():
	area.set_deferred("monitoring", true)


func _on_area_interact_body_entered(body):
	if body.get_parent() is generator:
		print("Within distance of a generator")
		interactable = body.get_parent()


func _on_area_interact_body_exited(body):
	if body.get_parent() is generator:
		print("No longer within distance of generator")
		interactable = null


func _on_alt_fire_timeout():
	shot_ready = true
	player_cooldown_over.emit()
