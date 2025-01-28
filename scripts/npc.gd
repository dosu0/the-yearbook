extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea

@export var dialog: DialogueResource = null

# @onready var lines = load("res://dialog/help_dialog.dialogue")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	DialogueManager.show_dialogue_balloon(dialog, "start")
	await DialogueManager.dialogue_ended
