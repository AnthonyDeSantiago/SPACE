extends CharacterBody2D


@export var SPEED = 800.0

@onready var projectile_scene = preload("res://Scenes/simple_proj.tscn")
@onready var proj_spawner = $Marker2D/Proj_Spawner



func _physics_process(delta):
	
	var vertical = Input.get_axis("up", "down")
	var horizontal = Input.get_axis("left", "right")
	
	if vertical:
		velocity.y = vertical * SPEED
	else:
		velocity.y = 0
		
	if horizontal:
		velocity.x = horizontal * SPEED
	else:
		velocity.x = 0
	move_and_slide()
	  
func _input(event):
	if event.is_action_pressed("click"):
		print("YO we clicked")
		var new_projectile: CharacterBody2D = projectile_scene.instantiate()
		
		print(new_projectile.position)
		new_projectile.global_position = proj_spawner.global_position
		get_parent().add_child(new_projectile)
		
