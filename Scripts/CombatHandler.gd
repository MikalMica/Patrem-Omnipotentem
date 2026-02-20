extends Node

@export var speed = 1.0
@export var density = 1.0
@export var attacks: Array[Node2D]


func _spawn_random_attack() -> void:
	var index = randi() % attacks.size()
	var currAttack = attacks[index]
	add_child(attacks[index])
