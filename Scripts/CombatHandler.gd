extends Node

@export var speed = 1.0
@export var density = 1.0
@export var speedIncrease = .5
@export var densityIncrease = .5
@export var attacks: Array[PackedScene]
@export var waitTime = 2.0
@export var nAttacks = 1
var attacksSpawned = 0
var currIndex
var currAttack : IAttack

func _ready() -> void:
	_spawn_random_attack()

func _spawn_random_attack() -> void:
	attacksSpawned += 1
	currIndex = randi() % attacks.size()
	currAttack = attacks[currIndex].instantiate() as IAttack
	add_child(currAttack)
	currAttack.attack_finished.connect(_despawn_attack)
	# añade velocidad y densidad al ataque

func _despawn_attack() -> void:
	remove_child(currAttack)
	await get_tree().create_timer(waitTime).timeout
	if attacksSpawned < nAttacks:
		_spawn_random_attack()
