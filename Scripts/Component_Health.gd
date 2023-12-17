extends Node2D

@export var health = 100

	#var timer = timer()
	
func take_damage(damage:float):
	$Timer.start()
	$EnemyHit.play()
	anim.play("death")
	


func _on_timer_timeout():
	get_parent().queue_free()
