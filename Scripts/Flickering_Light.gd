extends PointLight2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var countdown = .5
var timer = .5
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer -= delta
	if (timer <= 0):
		if (energy > 3):
			energy = 1
			timer = countdown
			print("dim")
		else:
			energy = 4
			timer = countdown
			print("brighten")
	
