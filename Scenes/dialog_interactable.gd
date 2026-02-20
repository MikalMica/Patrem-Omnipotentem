extends Area3D

@export var sprite : Sprite3D 
@export var normal_image : Texture2D
@export var affected_image : Texture2D

@export var dialog : DialogueResource
	
var player_is_near : bool
	
func _ready() -> void:
	body_entered.connect(on_body_change, true)
	body_exited.connect(on_body_change, false)

func on_body_change(body : Node3D, entered : bool) -> void: 
	if(body is not CharacterBody3D): 
		pass
		
		
	player_is_near = entered
	sprite.texture = affected_image if entered else normal_image
