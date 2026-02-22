extends Area3D

@export var ScenePath: String
@export var SceneIndex : int

func _ready() -> void:
	body_entered.connect(_body_entered)

func _body_entered(body: Node3D):
	if body is not CharacterBody3D:
		return
	
	SaveSceneState.savedTrans = false
	SaveSceneState.saveScenePath(SceneIndex)
	SceneManager.change_scene(ScenePath)
