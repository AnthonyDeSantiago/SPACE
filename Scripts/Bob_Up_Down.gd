extends Label

var tween_direction: Vector2 = Vector2(0, .25)

@onready var timer = 0
@export var timeout = .15
@onready var move_up: bool = true


func _process(delta):
	timer += delta
	if timer >= timeout:
		timer = 0
		if move_up:
			move_up = false
		else:
			move_up = true

	if move_up:
		position = position - tween_direction
	else:
		position = position + tween_direction
	
