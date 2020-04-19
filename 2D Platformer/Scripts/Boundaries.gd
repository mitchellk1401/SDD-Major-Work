extends Node2D

func _on_Area2D_body_entered(body): # Reloads the scene when player touches boundaries 
	get_tree().reload_current_scene()
	pass # Replace with function body.
