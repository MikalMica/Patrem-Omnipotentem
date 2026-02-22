extends Node3D

@export var player : CharacterBody3D
@export var y_billboard = false

func _process(_delta : float) -> void:
	look_at(player.global_position)
	if not y_billboard:
		rotation.x = .0
		rotation.z = .0
