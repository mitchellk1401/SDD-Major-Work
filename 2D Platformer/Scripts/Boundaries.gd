# Resets the position of the player when the player falls out of the level
extends Node2D

func _on_Area2D_body_entered(body): # Reloads the scene when player enters boundary
	get_tree().reload_current_scene()
	pass # Replace with function body.
