extends PointLight2D

@export var rotation_speed = 30



func _process(delta):
	rotation_degrees += rotation_speed * delta
