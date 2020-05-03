extends Control

func _ready(): # Called when scene/ script is initated 
	$Master/HSliderMaster.value = AudioServer.get_bus_volume_db(0) * 2 # Have to multiply the bus volume by 2 to restore to what the game uses due to engine bug?
	$Music/HSliderMusic.value = AudioServer.get_bus_volume_db(1) * 2
	$SFX/HSliderSFX.value = AudioServer.get_bus_volume_db(2) * 2
	
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

