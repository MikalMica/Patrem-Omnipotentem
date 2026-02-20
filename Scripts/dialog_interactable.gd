extends Area3D

@export var outline : Sprite3D 
@export var dialog : DialogueResource
@export var interact_canvas : TextFadeIn

var player_is_near : bool
	
func _ready() -> void:
	body_entered.connect(func(body : Node3D): on_body_change(body, true))
	body_exited.connect(func(body : Node3D): on_body_change(body, false))

func on_body_change(body : Node3D, entered : bool) -> void: 
	if(body is not CharacterBody3D): 
		return
		
	print("Entered is ", entered)
	player_is_near = entered
	outline.visible = entered
	
	interact_canvas.visible = entered
	if(entered):
		interact_canvas.fade_in()

func _input(event: InputEvent) -> void:
	if(player_is_near and event.is_action_pressed("Interact")):
		DialogueManager.show_dialogue_balloon(dialog, "start")
