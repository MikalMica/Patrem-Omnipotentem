extends Area3D

@export var ScenePath: String

func _body_entered(body: Node3D):
	if body is not CharacterBody3D:
		return
	
	SceneManager.change_scene(ScenePath)
