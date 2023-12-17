extends Node2D

@export var health = 100

#var anim

	#var timer = timer()
	
func take_damage(damage:float):
	#$Timer.start()
	#$EnemyHit.play()
	#anim.play("death")
	#get_parent().anim.play("death")
	#anim.stop()
	#anim.play("death")
	get_parent().queue_free()
	


#func _on_timer_timeout():
	#get_parent().queue_free()
	#
#func _ready():
	#anim = get_parent().get_child(1)
	
