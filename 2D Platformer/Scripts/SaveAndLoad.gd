# All the saving functionality
extends Node

var savePath = "user://settings.cfg" #In local system C:\Users\<MainUser>\AppData\Roaming\Godot\app_userdata\2D Platformer
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

# Saves game value which is broken into a section and a key	
func saveGameValue(section, key, value):
	config.set_value(section, key, value)
	config.save(savePath)
	
func loadGameValues(section):
	masterLevel = config.get_value(section, "Master", masterLevel) # Gets value from defined arguments
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

func saveCurrentTime():
	var gameTime = get_node("/root/Counter")
	saveGameValue("GameTime", "Seconds", gameTime.time)
	saveGameValue("GameTime", "Minutes", gameTime.mins)

func loadTimes():
	var gameTime = get_node("/root/Counter")
	gameTime.time = config.get_value("GameTime", "Seconds", gameTime.time) 
	gameTime.mins = config.get_value("GameTime", "Minutes", gameTime.time) 

func newTimes():
	var gameTime = get_node("/root/Counter")
	gameTime.time = 0
	gameTime.mins = 0
	


