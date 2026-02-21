extends IAttack
@export var time_between_spawns := 1.0 
@export var obstacle : PackedScene
var rng : RandomNumberGenerator = RandomNumberGenerator.new()

func _attack() -> void:
	for i in density:
		_spawn_obstacle()
		await get_tree().create_timer(time_between_spawns / speed).timeout
		
func _spawn_obstacle():
	var child = obstacle.instantiate() as FollowObstacle 
	
	var float1 = rng.randf_range(-radius, radius)
	var float2 = rng.randf_range(-radius, radius)
	child.global_position += Vector2(
		float1,
		float2
	)
	
	print("", float1, " ", float2)
	print(child.global_position)
	
	add_child(child)
