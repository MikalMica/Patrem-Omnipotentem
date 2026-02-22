extends Node

var currCombatScene : String

func changeTo(path: String) -> void:
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file(path)
	currCombatScene = path

func returnToLastCombat() -> void:
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file(currCombatScene)

func returnToScene(path:String) -> void:
	get_tree().change_scene_to_file(path)
