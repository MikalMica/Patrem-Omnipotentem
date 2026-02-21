extends AudioStreamPlayer3D

@export var min_delay : float
@export var max_delay : float
var current_time := .0
var target_delay
var rng : RandomNumberGenerator = RandomNumberGenerator.new()

func _process(delta: float) -> void:
	current_time += delta
	if(current_time < target_delay): return
	
	play()
	target_delay = rng.randf_range(min_delay, max_delay)
	current_time = .0
