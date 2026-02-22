extends Area3D

@export var outline : Sprite3D 
@export var dialog : DialogueResource
@export var interact_canvas : TextFadeIn
@export var enemyName : String

var player_is_near : bool
var in_dialogue : bool = false
var player : CharacterBody3D
	
func _ready() -> void:
	body_entered.connect(func(body : Node3D): on_body_change(body, true))
	body_exited.connect(func(body : Node3D): on_body_change(body, false))
	
	DialogueManager.dialogue_ended.connect(func(dialogue) -> void: in_dialogue)

func on_body_change(body : Node3D, entered : bool) -> void: 
	if(body is not CharacterBody3D): 
		return
		
	player_is_near = entered
	outline.visible = entered
	player = body
	
	if (interact_canvas != null):
		interact_canvas.visible = entered
		if(entered):
			interact_canvas.fade_in()

func _input(event: InputEvent) -> void:
	if(player_is_near and event.is_action_pressed("Interact") and not in_dialogue and !SaveSceneState.is_defeated(enemyName)):
		in_dialogue = true
		SaveSceneState.savePlayerTrans(player)
		SaveSceneState.saveNextDialogue(dialog, "CombatEnd")
		DialogueManager.show_dialogue_balloon(dialog, "start")
		if(interact_canvas != null):
			interact_canvas.visible = false
