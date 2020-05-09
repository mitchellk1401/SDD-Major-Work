extends Control

var test = 0
func _ready():
	var saveAndLoad = get_node("/root/SaveAndLoad")
	
func _physics_process(delta):
	var music = get_node("/root/Music")
	
	if Input.is_action_just_pressed("ui_accept"):
		SaveAndLoad.saveCurrentGameValues()
		get_tree().change_scene("res://Scenes/GameScenes/Tutorial.tscn")
		music.play(true)
		
	else:
		music.play(false)

	
func _on_StartGameButton_pressed():
	var music = get_node("/root/Music")
	get_tree().change_scene("res://Scenes/GameScenes/Tutorial.tscn")
	SaveAndLoad.saveCurrentGameVolumes()
	SaveAndLoad.saveCurrentLevel()
	pass 


func _on_QuitGameButton2_pressed():
	SaveAndLoad.saveCurrentGameVolumes()
	get_tree().quit()
	pass 


func _on_CheckBox_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
	pass 
