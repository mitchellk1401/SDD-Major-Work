extends Control



	
func _on_StartGameButton_pressed():
	var music = get_node("/root/Music")
	get_tree().change_scene("res://Scenes/GameScenes/Tutorial.tscn")
	music.play(true)
	
	pass # Replace with function body.


func _on_QuitGameButton2_pressed():
	get_tree().quit()
	pass # Replace with function body.

