extends Node2D

@export var target_body: CharacterBody2D

@onready var target:Vector2

func _process(delta):
	if target_body == null:
		print("Component_Enemy_Rotation: target_body is null!")
	else:
		target = target_body.position
		get_parent().look_at(target)
