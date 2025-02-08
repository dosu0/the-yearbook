extends Node
@onready var academics_bar: ProgressBar = %AcademicsBar
@onready var stats: VBoxContainer = $HUD/Stats

var health: int
		
var academics: int:
	set(new_academics):
		academics = new_academics
		academics_bar.value = academics
	get():
		return academics
var social: int
var mental: int 
var money: int

var is_playing: bool:
	set(is_playing_now):
		is_playing = is_playing_now
		if is_playing:
			stats.show()
		else:
			stats.hide()
	get():
		return is_playing

func _ready() -> void:
	is_playing = false
	health = 50
	academics = 50
	social = 50
	mental = 50
	money = 50
