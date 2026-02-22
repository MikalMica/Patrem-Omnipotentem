extends Node

var player : Transform3D
var nextDialogue : DialogueResource
var nextDialogueTag : String
var defeated : Dictionary # Strings and Booleans
var paths : Array[String]
var savedTrans : bool = false
var savedDialogue : bool = false
var isInDialogue : bool = false
var currScene : int = 0

func _ready() -> void:
	defeated = {"Comecables": false,
				"Lesbiana": false,
				"Alfonso": false,
				"Bocabajo": false,
				"Pater": false}
	paths = [
		"res://Scenes/Scenarios/main_scene.tscn",
		"res://Scenes/Scenarios/tunnel_labyrinth.tscn",
		"res://Scenes/Scenarios/CableRoom.tscn",
		"res://Scenes/Scenarios/church.tscn"
	]

func defeat(npc: String) -> void:
	defeated[npc] = true

func player_saved() -> bool:
	return savedTrans
	
func dialogue_saved() -> bool:
	return savedDialogue

func is_defeated(npc: String) -> bool:
	return defeated[npc]

func savePlayerTrans(plyr: Node3D):
	player = plyr.transform
	savedTrans = true

func saveScenePath(index: int) -> void:
	currScene = index

func saveNextDialogue(dialogue: DialogueResource, tag: String) -> void:
	nextDialogue = dialogue
	nextDialogueTag = tag
	savedDialogue = true

func loadPlayerTrans() -> Transform3D:
	return player

func loadNextDialogue() -> void:
	savedDialogue = false
	isInDialogue = true
	DialogueManager.show_dialogue_balloon(nextDialogue, nextDialogueTag)
	await DialogueManager.dialogue_ended
	notInDialogue()

func loadCurrScene() -> void:
	SceneHandler.returnToScene(paths[currScene])

func notInDialogue() -> void:
	isInDialogue = false

func inDialogue() -> bool:
	return isInDialogue
