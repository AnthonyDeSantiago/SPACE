extends CanvasModulate

var player: CharacterBody2D
var arrow: Sprite2D

func _ready():
	player = $"../simple_char"
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	arrow = player.get_child(7).get_child(0)
	print(arrow.canvas_modulate)
	
