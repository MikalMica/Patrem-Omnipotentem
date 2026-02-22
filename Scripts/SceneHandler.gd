extends Node

var mainScene : Node
var currCombatScene : String

func registerMainScene(scene: Node3D) -> void:
	mainScene = scene

func changeTo(path: String) -> void:
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file(path)
	currCombatScene = path

func returnToLastCombat() -> void:
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file(currCombatScene)

func returnToMain() -> void:
	get_tree().change_scene_to_file("res://Scenes/Scenarios/main_scene.tscn")
