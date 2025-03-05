extends Node3D

var time_passed = 0.0
var delays = [0.05, 0.2, 0.5, 1, 1.5, 2, 4]
var current_delay = 4
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	time_passed = seconds_since_start_of_day()
	$SecondsHand.rotation.y = -deg_to_rad(time_passed * 6)
	$MinuteHand.rotation.y = -deg_to_rad(time_passed * 0.1)
	$HourHand.rotation.y = -deg_to_rad(time_passed / 120)

func seconds_since_start_of_day():
	var nowtime = Time.get_datetime_dict_from_system()
	var seconds_passed = (nowtime["hour"] * 3600) + (nowtime["minute"] * 60) + nowtime["second"]
	return seconds_passed

func _on_seconds_hand_tick() -> void:
	$MinuteHand.rotate(Vector3.UP, -deg_to_rad(0.1))
	$HourHand.rotate(Vector3.UP, -deg_to_rad(0.01))

func interact():
	$SecondsHand.set_delay(delays[current_delay])
	current_delay += 1
	if current_delay > 6: current_delay = 0
