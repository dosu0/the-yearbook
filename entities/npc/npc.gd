extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea

@export var dialog: DialogueResource = null

# @onready var lines = load("res://dialog/help_dialog.dialogue")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")

# This function is ran any time the player presses SPACE near an NPC
# or any other interactable object
func _on_interact():
	# Use the global dialog manager to display a dialog balloon on screen
	DialogueManager.show_dialogue_balloon(dialog, "start")
	# wait for the dialog to finish before moving on
	await DialogueManager.dialogue_ended
