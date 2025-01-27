extends Node2D

func _ready() -> void:
	GameManager.is_playing = true
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)
	
	#var resource = load("res://dialog/help.dialogue")
	#await get_tree().create_timer(0.5).timeout
	# DialogueManager.show_dialogue_balloon(resource, "help")

#region signals

func _on_dialogue_ended(_resource):
	get_tree().change_scene_to_file("res://levels/club_fair.tscn")
	
#endregion
