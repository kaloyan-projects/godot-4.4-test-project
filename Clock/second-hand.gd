extends Node3D

var ticks = [ preload("tick1.ogg"),
preload("tick2.ogg"), preload("tick3.ogg") ]
signal tick

func _on_timer_timeout() -> void:
	$AnimationPlayer.play("SecondHandAction")
	rotate(Vector3.UP, deg_to_rad(-6))
	$AudioStreamPlayer3D.stream = ticks.pick_random()
	$AudioStreamPlayer3D.play()
	tick.emit()
