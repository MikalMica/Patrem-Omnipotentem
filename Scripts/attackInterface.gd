extends Node2D
class_name IAttack

@export var speed = 1.0
@export var density := 1
@export var lifeTime = 15.0
@export var radius = 15.0
signal attack_finished

func _ready() -> void:
	_attack()
	await get_tree().create_timer(lifeTime).timeout
	attack_finished.emit()

func set_speed_and_density(spd: float, dty: int) -> void:
	speed = spd
	density = dty

func _attack() -> void:
	pass
