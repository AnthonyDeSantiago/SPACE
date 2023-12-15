extends Node2D

func _on_child_entered_tree(node):
	if node is enemy:
		node.enemy_set_target($simple_char)
