extends Node

@onready var health_bar: ProgressBar = %HealthBar
@onready var academics_bar: ProgressBar = %AcademicsBar
@onready var social_bar: ProgressBar = %SocialBar
@onready var mental_bar: ProgressBar = %MentalBar
@onready var money_bar: ProgressBar = %MoneyBar
@onready var stats: VBoxContainer = $HUD/Stats

var health: int:
	set(new_health):
		health = new_health
		health_bar.value = health
	get():
		return health	
var academics: int:
	set(new_academics):
		academics = new_academics
		academics_bar.value = academics
	get():
		return academics
var social: int:
	set(new_social):
		social = new_social
		social_bar.value = social
	get():
		return social
var mental: int:
	set(new_mental):
		mental = new_mental
		mental_bar.value = mental
	get():
		return mental
var money: int:
	set(new_money):
		money = new_money
		money_bar.value = money
	get():
		return money

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
