extends Node

var player : Transform3D
var nextDialogue : DialogueResource
var nextDialogueTag : String
var defeated : Dictionary # Strings and Booleans
var savedTrans : bool = false
var savedDialogue : bool = false
var isInDialogue : bool = false

func _ready() -> void:
	defeated = {"Comecables": false,
				"Lesbiana": false,
				"Alfonso": false,
				"Bocabajo": false}

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
	DialogueManager.dialogue_ended.connect(notInDialogue)

func notInDialogue() -> void:
	isInDialogue = false

func inDialogue() -> bool:
	return isInDialogue
