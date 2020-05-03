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
	pass 


func _on_QuitGameButton2_pressed():
	get_tree().quit()
	pass 



func _on_CheckBox_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
	pass 

#---------------------------------- Music ----------------------------------
# Busses start from 0 going to 2 with 0 being the master 1 being music 2 being sfx
func _ready(): # Called when scene/ script is initated 
	$MusicSliders/Master/HSliderMaster.value = AudioServer.get_bus_volume_db(0) * 2 # Have to multiply the bus volume by 2 to restore to what the game uses due to engine bug?
	$MusicSliders/Master/HSliderMusic.value = AudioServer.get_bus_volume_db(1) * 2
	$MusicSliders/Master/HSliderSFX.value = AudioServer.get_bus_volume_db(2) * 2
	
func _on_HSliderMaster_value_changed(value):
	print(AudioServer.get_bus_volume_db(0))
#	$MusicSliders/Master/HSliderMaster.value = -5
	AudioServer.set_bus_volume_db(0, lerp(AudioServer.get_bus_volume_db(1), value, 0.5)) #Values being lerped in order to stop audio clipping
	if value == -24: #Without statement the music will play at a very low level
		AudioServer.set_bus_mute(0, true)
	else:
		AudioServer.set_bus_mute(0, false)
	pass # Replace with function body.


func _on_HSliderMusic_value_changed(value):
	AudioServer.set_bus_volume_db(1, lerp(AudioServer.get_bus_volume_db(1), value, 0.5)) #Values being lerped in order to stop audio clipping
	if value == -24: #Without statement the music will play at a very low level
		AudioServer.set_bus_mute(1, true)
	else:
		AudioServer.set_bus_mute(1, false)
	pass # Replace with function body.


func _on_HSliderSFX_value_changed(value):
	AudioServer.set_bus_volume_db(2, lerp(AudioServer.get_bus_volume_db(1), value, 0.5)) #Values being lerped in order to stop audio clipping
	if value == -24: #Without statement the music will play at a very low level
		AudioServer.set_bus_mute(2, true)
	else:
		AudioServer.set_bus_mute(2, false)
	pass # Replace with function body.



