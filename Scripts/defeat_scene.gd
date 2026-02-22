extends Node2D
@onready var retry: Button = $Retry
@onready var exit: Button = $Exit

func _ready() -> void:
	var stylebox: StyleBox = exit.get_theme_stylebox("normal")
	stylebox.bg_color = Color(0.0, 0.0, 0.0, 0.0)
	exit.add_theme_stylebox_override("normal", stylebox)
	retry.add_theme_stylebox_override("normal", stylebox)
	exit.add_theme_stylebox_override("hover", stylebox)
	retry.add_theme_stylebox_override("hover", stylebox)

func _exit() -> void:
	# menu principal
	pass

func _retry() -> void:
	# reinicia el combate
	pass
