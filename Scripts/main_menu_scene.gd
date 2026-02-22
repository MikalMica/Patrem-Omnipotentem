extends Control
@onready var start: Button = $Start
@onready var exit: Button = $Exit

func _ready() -> void:
	var stylebox: StyleBox = exit.get_theme_stylebox("normal")
	stylebox.bg_color = Color(0.0, 0.0, 0.0, 0.0)
	exit.add_theme_stylebox_override("normal", stylebox)
	start.add_theme_stylebox_override("normal", stylebox)
	exit.add_theme_stylebox_override("hover", stylebox)
	start.add_theme_stylebox_override("hover", stylebox)

func _exit() -> void:
	get_tree().quit()

func _start() -> void:
	SceneManager.change_scene("res://Scenes/Scenarios/main_scene.tscn")
