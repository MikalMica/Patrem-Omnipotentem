extends IAttack

@export var radius = 50
@export var timeBetweenAttacks = 1.0
var obstacle = preload("res://Scenes/Objects/attack_placeholder.tscn")
@onready var timer = Timer.new()

func _attack() -> void:
	var obs = obstacle.instantiate() as DirSeeker
	var randAng = randf() * (2 * PI)
	var pos = Vector2(cos(randAng) * radius, sin(randAng) * radius)
	obs.position = pos
	obs.set_direction(position - pos)
	add_child(obs)
	timer.start(timeBetweenAttacks)
	timer.timeout.connect(_attack)
