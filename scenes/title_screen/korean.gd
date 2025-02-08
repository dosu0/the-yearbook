extends TextureButton

@onready var play: Button = $"../../MarginContainer/VBoxContainer/MarginContainer/MenuOptions/Play"
@onready var help: Button = $"../../MarginContainer/VBoxContainer/MarginContainer/MenuOptions/Help"
@onready var save: Button = $"../../MarginContainer/VBoxContainer/MarginContainer/MenuOptions/Save"
@onready var quit: Button = $"../../MarginContainer/VBoxContainer/MarginContainer/MenuOptions/Quit"

func _pressed() -> void:
	play.text = "게임 시작"
	help.text = "도움"
	save.text = "저장하기 / 불러오기"
	quit.text = "나가기"
