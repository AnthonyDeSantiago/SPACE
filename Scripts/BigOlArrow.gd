extends Sprite2D

@onready var player = $"../../simple_char"

func _ready():
	position = player.position
	visible = false

func _process(delta):
	position = player.position
	
	if (player.broken_gen != null):
		if position.distance_to(player.broken_gen.position) >= 400:
			visible = true
			look_at(player.broken_gen.position)
		else:
			visible = false
	else:
		visible = false
