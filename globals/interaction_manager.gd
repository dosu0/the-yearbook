extends Node2D

var player: CharacterBody2D:
	get:
		if GameManager.is_playing:
			return get_tree().current_scene.get_tree().get_first_node_in_group("player")
		else:
			return null

@onready var arrow: AnimatedSprite2D = $Arrow
var active_areas: Array[Area2D] = []
var can_interact: bool = true

func register_area(area: InteractionArea):
	active_areas.push_back(area)

func unregister_area(area: InteractionArea):
	var index = active_areas.find(area)
	if index != -1:
		active_areas.remove_at(index)

func _process(_delta) -> void:
	if (not active_areas.is_empty()) and can_interact and GameManager.is_playing:
		active_areas.sort_custom(_sort_by_distance_to_player)

		arrow.global_position = active_areas[0].global_position
		arrow.global_position.y -= 16 
		arrow.show()
	else:
		arrow.hide()

func _sort_by_distance_to_player(area1: Area2D, area2: Area2D) -> bool:
	var d1 = player.global_position.distance_to(area1.global_position)
	var d2 = player.global_position.distance_to(area2.global_position)
	
	return d1 < d2

func _input(event):
	if event.is_action_pressed("interact") and can_interact:
		if not active_areas.is_empty():
			can_interact = false
			arrow.hide()
			
			await active_areas[0].interact.call()
			
			can_interact = true
