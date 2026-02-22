extends Control
@onready var retry: Button = $Retry
@onready var exit: Button = $Exit

func _ready() -> void:
	var stylebox: StyleBox = exit.get_theme_stylebox("normal")
	stylebox.bg_color = Color(0.0, 0.0, 0.0, 0.0)
	exit.add_theme_stylebox_override("normal", stylebox)
	retry.add_theme_stylebox_override("normal", stylebox)
	exit.add_theme_stylebox_override("hover", stylebox)
	retry.add_theme_stylebox_override("hover", stylebox)
	Input.mouse_mode =Input.MOUSE_MODE_VISIBLE

func _exit() -> void:
	SceneManager.change_scene("res://Scenes/Scenarios/main_menu_scene.tscn")

func _retry() -> void:
	Input.mouse_mode =Input.MOUSE_MODE_CAPTURED
	SceneHandler.returnToLastCombat()
