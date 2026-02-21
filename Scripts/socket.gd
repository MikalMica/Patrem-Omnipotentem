extends Node2D

@export var wire:TextureRect
@export var head:Sprite2D
var extending:bool = true

@export var target:Node2D

func _ready() -> void:
	var center:Vector2 = get_tree().get_first_node_in_group(&"CENTER").global_position
	global_position.y = center.y
	target.global_position = center
	
	await get_tree().create_timer(1).timeout
	
	var tween:Tween = get_tree().create_tween()
	tween.set_ease(Tween.EASE_IN)
	tween.set_trans(Tween.TRANS_EXPO)
	tween.tween_property(head, "global_position", target.global_position, 0.5)

func _process(_delta: float) -> void:
	if not extending: return
	extend()
	
func extend():
	wire.size.x = head.position.x
