extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player: CharacterBody2D = %Player
@export var dialog: DialogueResource = load("res://dialog/cheat.dialogue")

func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	DialogueManager.show_dialogue_balloon(dialog, "start")
	player.global_position = self.global_position
	player.global_position.y -= 10
	player.animation_to_play = "sit_right"
	await DialogueManager.dialogue_ended
	player.animation_to_play = "idle_right"
