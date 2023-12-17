extends Label

@onready var num_chars: int
@onready var timeout = .035
@onready var timer = 0
@onready var counter = 3
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
			label_settings.font_color.a -= .0045
			
		
	if (visible_characters == num_chars && label_settings.font_color.a <= 0):
			counter -= 1
			print(counter)
			if (counter <= 0):
				queue_free()
			
	if label_settings.font_color.a <= 0 and counter >= 2:
		visible_characters = 0
		label_settings.font_color.a = 1
		#text = "MOVE: W,A,S,D\nSHOOT: LEFT CLICK\nREPAIR: E\NREGEN MISSLE: RIGHT CLICK"
		text = "MOVE: W,A,S,D\nSHOOT: LEFT CLICK"
	
	if label_settings.font_color.a <= 0 and counter >= 1:
		visible_characters = 0
		label_settings.font_color.a = 1
		#text = "MOVE: W,A,S,D\nSHOOT: LEFT CLICK\nREPAIR: E\NREGEN MISSLE: RIGHT CLICK"
		text = "REPAIR: E\nREGEN: RIGHT CLICK"
		
		
