extends Area2D

# Export: Makes a variable which can be edited/ placed in the inspector for the scene
export(String, FILE, "*.tscn") var world_scene


func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			get_tree().change_scene(world_scene)
	

	pass
