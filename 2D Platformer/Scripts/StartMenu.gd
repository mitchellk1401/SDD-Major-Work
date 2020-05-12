extends Control

func _ready():
	var saveAndLoad = get_node("/root/SaveAndLoad")
	saveAndLoad.updateValues()
	
func _physics_process(delta):
	var music = get_node("/root/Music")
	
	if Input.is_action_just_pressed("ui_accept"):
		var currentLevel = SaveAndLoad.level
		SaveAndLoad.saveCurrentGameVolumes()
		get_tree().change_scene(currentLevel)
		music.play(true)
		
	else:
		music.play(false)

	
func _on_StartGameButton_pressed():
	var music = get_node("/root/Music")
	SaveAndLoad.saveCurrentGameVolumes()
	SaveAndLoad.saveGameValue("Level", "Upto", "res://Scenes/GameScenes/Tutorial.tscn")
	get_tree().change_scene("res://Scenes/GameScenes/Tutorial.tscn")
	pass 


func _on_QuitGameButton2_pressed():
	SaveAndLoad.saveCurrentGameVolumes()
	get_tree().quit()
	pass 


func _on_CheckBox_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
	pass 


func _on_ResumeGameButton_pressed():
	var currentLevel = SaveAndLoad.level
	get_tree().change_scene(currentLevel)
	pass # Replace with function body.
