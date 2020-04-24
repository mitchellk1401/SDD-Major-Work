extends Control


func _physics_process(delta):
	var music = get_node("/root/Music")
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://Scenes/GameScenes/Tutorial.tscn")
		music.play(true)

	
func _on_StartGameButton_pressed():

	var music = get_node("/root/Music")
	get_tree().change_scene("res://Scenes/GameScenes/Tutorial.tscn")
	music.play(true)

	pass # Replace with function body.


func _on_QuitGameButton2_pressed():
	get_tree().quit()
	pass # Replace with function body.



func _on_CheckBox_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
	pass # Replace with function body.
