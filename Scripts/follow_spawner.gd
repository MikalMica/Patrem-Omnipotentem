extends IAttack
@export var time_between_spawns := 1.0 
@export var obstacle : PackedScene
@onready var rng := RandomNumberGenerator.new

func _attack() -> void:
	for i in density:
		_spawn_obstacle()
		await get_tree().create_timer(time_between_spawns / speed).timeout
		
func _spawn_obstacle():
	var child = obstacle.instantiate() as FollowObstacle 
	child.position += Vector2(randf_range(0, radius), randf_range(0, radius))
	add_child(child)
