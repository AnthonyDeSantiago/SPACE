extends Node2D

class_name generator

@onready var label:Label = $Label
@onready var broken = false

signal generator_has_been_fixed()
signal generator_has_been_broken(this_generator)

func _ready():
	label.visible = false


func display_generator_message():
	label.visible = true


func fix_generator():
	if broken:
		broken = false
		generator_has_been_fixed.emit()
		label.visible = false

func break_generator():
	broken = true
	generator_has_been_broken.emit(self)
	label.visible = true
