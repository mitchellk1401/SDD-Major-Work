extends Area2D

# Export: Makes a variable which can be edited/ placed in the inspector for the scene
export(String, FILE, "*.tscn") var world_scene

onready var saveAndLoad = get_node("/root/SaveAndLoad")
onready var timerRunning = get_node("/root/Counter")
	


func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			SaveAndLoad.saveGameValue("Level", "Upto", world_scene)
			get_tree().change_scene(world_scene)
			saveAndLoad.saveCurrentTime()
			timerRunning.gameRunning = true
	

	pass
