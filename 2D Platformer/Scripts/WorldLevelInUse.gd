extends Node2D

onready var timerRunning = get_node("/root/Counter")

func _ready():
	timerRunning.gameRunning = true
