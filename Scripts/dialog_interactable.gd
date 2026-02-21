extends Area3D

@export var outline : Sprite3D 
@export var dialog : DialogueResource
@export var interact_canvas : TextFadeIn

var player_is_near : bool
var in_dialogue : bool = false
	
func _ready() -> void:
	body_entered.connect(func(body : Node3D): on_body_change(body, true))
	body_exited.connect(func(body : Node3D): on_body_change(body, false))
	
	DialogueManager.dialogue_ended.connect(func(dialogue) -> void: in_dialogue)

func on_body_change(body : Node3D, entered : bool) -> void: 
	if(body is not CharacterBody3D): 
		return
		
	player_is_near = entered
	outline.visible = entered
	
	interact_canvas.visible = entered
	if(entered):
		interact_canvas.fade_in()

func _input(event: InputEvent) -> void:
	if(player_is_near and event.is_action_pressed("Interact") and not in_dialogue):
		in_dialogue = true
		DialogueManager.show_dialogue_balloon(dialog, "start")
		interact_canvas.visible = false
