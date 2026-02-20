extends Area3D

@export var outline : Sprite3D 
@export var dialog : DialogueResource

var player_is_near : bool
	
func _ready() -> void:
	body_entered.connect(on_body_change, true)
	body_exited.connect(on_body_change, false)

func on_body_change(body : Node3D, entered : bool) -> void: 
	if(body is not CharacterBody3D): 
		pass
		
	player_is_near = entered
	outline.visible = entered

func _input(event: InputEvent) -> void:
	if(player_is_near and event.is_action_pressed("Interact")):
		DialogueManager.show_dialogue_balloon(dialog, "start")
