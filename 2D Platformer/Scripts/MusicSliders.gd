extends Control

func _ready(): # Called when scene/ script is initated
	SaveAndLoad.updateValues()  
	$Master/HSliderMaster.value = SaveAndLoad.masterLevel
	$Music/HSliderMusic.value = SaveAndLoad.musicLevel
	$SFX/HSliderSFX.value = SaveAndLoad.musicSFXLevel
	
func _on_HSliderMaster_value_changed(value):
	AudioServer.set_bus_volume_db(0, lerp(AudioServer.get_bus_volume_db(0), value, 0.5)) #Values being lerped in order to stop audio clipping
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
	AudioServer.set_bus_volume_db(2, lerp(AudioServer.get_bus_volume_db(2), value, 0.5)) #Values being lerped in order to stop audio clipping
	if value == -24: #Without statement the music will play at a very low level
		AudioServer.set_bus_mute(2, true)
	else:
		AudioServer.set_bus_mute(2, false)
	pass # Replace with function body.

