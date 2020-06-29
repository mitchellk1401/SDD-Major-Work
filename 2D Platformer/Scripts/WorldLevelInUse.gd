# Ensures the timer only works on specified levels
extends Node2D
# gameRunning variable is only ever turned to true when this script runs, script is attatched to all game levels excluding the tutorial
onready var timerRunning = get_node("/root/Counter")

func _ready():
	timerRunning.gameRunning = true
	
	
