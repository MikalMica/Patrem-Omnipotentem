extends Node2D
class_name DirSeeker

var movement_direction: Vector2
@export var speed = 1.0
@export var lifetime = 5.0

func _ready() -> void:
	await get_tree().create_timer(lifetime).timeout
	queue_free()

func _process(delta: float) -> void:
	position += movement_direction * speed

func set_direction(dir: Vector2) -> void:
	movement_direction = dir.normalized()
