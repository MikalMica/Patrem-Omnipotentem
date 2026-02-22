extends IAttack
@export var time_between_spawns := 1.0 
@export var obstacle : PackedScene
@export var areaOffset: Vector2
@onready var player : CharacterBody2D = get_tree().get_first_node_in_group("Player2D")

func _attack() -> void:
	density = 5
	while !attackStop:
		for i in range(0, density):
			_spawn_obstacle()
		await get_tree().create_timer(time_between_spawns / speed).timeout

func _spawn_obstacle():
	var child = obstacle.instantiate()
	add_child.call_deferred(child)
	
	var randomXPos = randf() * radius
	var randomYPos = randf() * radius
	child.global_position = Vector2(randomXPos, randomYPos) + areaOffset
