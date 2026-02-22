extends Node

func _ready() -> void:
	if FileAccess.file_exists("MarioVaquerizo.jpg"):
		print("TODO EN ORDEN")
	else:
		brutal_crash("¿DÓNDE ESTÁ MARIO VAQUERIZO?")

func brutal_crash(reason:String):
	get_tree().change_scene_to_file("res://Scenes/error_scene.tscn")

	await get_tree().create_timer(2.0).timeout
	get_tree().quit(1)
