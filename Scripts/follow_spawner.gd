extends IAttack
@export var time_between_spawns := 1.0 
@export var obstacle : PackedScene
@onready var player : CharacterBody2D = get_tree().get_first_node_in_group(&"Player2D")

func _attack() -> void:
	while !attackStop:
		for i in range(0, density):
			_spawn_obstacle()
		await get_tree().create_timer(time_between_spawns / speed).timeout

func _spawn_obstacle():
	var child = obstacle.instantiate()
	add_child.call_deferred(child)
	var randomAngle := randf_range(0, 360)
	var randomDir := Vector2(sin(deg_to_rad(randomAngle)), cos(deg_to_rad(randomAngle)))
	child.global_position = player.global_position + randomDir * radius
