extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if SaveSceneState.player_saved():
		$Player.transform = SaveSceneState.loadPlayerTrans()
	if SaveSceneState.dialogue_saved():
		SaveSceneState.loadNextDialogue()
