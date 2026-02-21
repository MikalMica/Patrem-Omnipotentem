extends Node2D

@export var wire:TextureRect
@export var head:Node2D

@export var target:Node2D

func _ready() -> void:
	var center:Vector2 = get_tree().get_first_node_in_group(&"CENTER").global_position
	
	look_at(center)
	
	var distance = global_position.distance_to(target.global_position)
	target.global_position = center
	target.look_at(global_position)
	
	await get_tree().create_timer(1).timeout
	var tween:Tween = get_tree().create_tween()
	tween.set_ease(Tween.EASE_IN)
	tween.set_trans(Tween.TRANS_EXPO)
	tween.tween_property(head, "global_position", target.global_position, 0.5)
	
	var o_tween:Tween = get_tree().create_tween()
	o_tween.set_ease(Tween.EASE_IN)
	o_tween.set_trans(Tween.TRANS_EXPO)
	o_tween.tween_property(wire, "size:x", distance, 0.5)
