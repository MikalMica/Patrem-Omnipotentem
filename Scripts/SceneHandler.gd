extends Node

var mainScene : Node

func registerMainScene(scene: Node3D) -> void:
	mainScene = scene

func changeTo(path: String) -> void:
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file(path)

func returnToMain() -> void:
	get_tree().change_scene_to_file("res://Scenes/Scenarios/main_scene.tscn")
