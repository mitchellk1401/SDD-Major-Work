extends Node

var savePath = "user://settings.cfg"
var config = ConfigFile.new()
var loadResponse = config.load(savePath)

var level 
var masterLevel = 0
var musicLevel = 0
var musicSFXLevel = 0

func updateValues():
	loadGameValues("Volumes")
	level = config.get_value("Level", "Upto", level)
	pass

	
func saveGameValue(section, key, value):
	config.set_value(section, key, value)
	config.save(savePath)
	
func loadGameValues(section):
	masterLevel = config.get_value(section, "Master", masterLevel)
	musicLevel = config.get_value(section, "Music", musicLevel)
	musicSFXLevel = config.get_value(section, "SFX", musicSFXLevel)
	return

func saveCurrentGameVolumes():
	masterLevel = AudioServer.get_bus_volume_db(0)
	musicLevel = AudioServer.get_bus_volume_db(1)
	musicSFXLevel = AudioServer.get_bus_volume_db(2)
	saveGameValue("Volumes", "Master", masterLevel)
	saveGameValue("Volumes", "Music", musicLevel)
	saveGameValue("Volumes", "SFX", musicSFXLevel)
	pass


#func newGame():
#	saveGameValue("Level", "Upto", "res://Scenes/GameScenes/Tutorial.tscn")


