extends Node3D

@export var player : CharacterBody3D

func _process(delta : float) -> void:
	look_at(player.global_position)
	rotation.x = .0
	rotation.z = .0
