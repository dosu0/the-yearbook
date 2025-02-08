extends TextureButton

@onready var play: Button = $"../../MarginContainer/VBoxContainer/MarginContainer/MenuOptions/Play"
@onready var help: Button = $"../../MarginContainer/VBoxContainer/MarginContainer/MenuOptions/Help"
@onready var save: Button = $"../../MarginContainer/VBoxContainer/MarginContainer/MenuOptions/Save"
@onready var quit: Button = $"../../MarginContainer/VBoxContainer/MarginContainer/MenuOptions/Quit"

func _pressed() -> void:
	play.text = "Play"
	help.text = "Help"
	save.text = "Save / Load"
	quit.text = "Quit"
