extends Node2D


func _ready() -> void:
	GameManager.is_playing = true
	DialogueManager.show_dialogue_balloon(load("res://dialog/fbla.dialogue"), "start")
