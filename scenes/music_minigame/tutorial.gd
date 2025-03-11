extends Node2D

func _ready() -> void:
	GameManager.is_playing = true
	await DialogueManager.dialogue_ended
	get_tree().change_scene_to_file("res://scenes/club_fair/club_fair.tscn")
