# Controls the pause menu which is attatched too the player's KinematicBody
extends Control

onready var saveAndLoad = get_node("/root/SaveAndLoad")

func _input(event):
	# When pause is presses it shows the UI and saves the current time, 
	if event.is_action_pressed("pause"):
		var pause_state = not get_tree().paused
		get_tree().paused = pause_state # Pauses the physics process of the game, pause menu doesn't inherit the physics process hence will run even with the physics processed paused
		visible = pause_state
		saveAndLoad.saveCurrentTime()


func _on_Resume_pressed():
	SaveAndLoad.saveCurrentGameVolumes()
	get_tree().paused = false
	visible = false

	pass # Replace with function body.


func _on_Exit_pressed():
	SaveAndLoad.saveCurrentGameVolumes()
	get_tree().quit()
	pass # Replace with function body.


func _on_CheckBox_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
	pass # Replace with function body.


func _on_RtoMenu_pressed():
	SaveAndLoad.saveCurrentGameVolumes()
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/GameScenes/StartMenu.tscn")
	pass # Replace with function body.
	
