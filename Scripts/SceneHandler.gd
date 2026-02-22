extends Node

var currCombatScene : String

func changeTo(path: String) -> void:
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file(path)
	currCombatScene = path

func returnToLastCombat() -> void:
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file(currCombatScene)

func returnToMain() -> void:
	get_tree().change_scene_to_file("res://Scenes/Scenarios/main_scene.tscn")
