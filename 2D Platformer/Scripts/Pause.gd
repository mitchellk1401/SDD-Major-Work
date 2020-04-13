extends Control

func _input(event):
	if event.is_action_pressed("pause"):
		var pause_state = not get_tree().paused
		get_tree().paused = pause_state
		visible = pause_state


func _on_Resume_pressed():
	get_tree().paused = false
	visible = false

	pass # Replace with function body.


func _on_Exit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_CheckBox_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
	pass # Replace with function body.
