extends Label

@onready var num_chars: int
@onready var timeout = .035
@onready var timer = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	num_chars = get_total_character_count()
	visible_characters = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	if timer >= timeout:
		if visible_characters < num_chars:
			visible_characters += 1
			timer = 0
		else:
			label_settings.font_color.a -= .01
