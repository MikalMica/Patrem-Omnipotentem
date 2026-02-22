extends Node2D

@export var attacks: Array[PackedScene]
@export var waitTime = 2.0
@export var nAttacks = 1
@export var dialogue: DialogueResource
@export var enemyName: String
var attacksSpawned = 0
var currIndex
var currAttack : IAttack

func _ready() -> void:
	await SignalBus.combatAnimationFinished
	_spawn_random_attack()
	SignalBus.defeated.connect(_delete_everything)

func _spawn_random_attack() -> void:
	if(attacks.size() == 0): 
		return
	
	attacksSpawned += 1
	currIndex = randi() % attacks.size()
	currAttack = attacks[currIndex].instantiate() as IAttack
	add_child(currAttack)
	currAttack.global_position = global_position
	currAttack.attack_finished.connect(_despawn_attack)

func _despawn_attack() -> void:
	remove_child(currAttack)
	if dialogue != null:
		var start = "Combat" + str(attacksSpawned)
		DialogueManager.show_dialogue_balloon(dialogue, start)
		await DialogueManager.dialogue_ended
	else: await get_tree().create_timer(waitTime).timeout
	if attacksSpawned < nAttacks:
		_spawn_random_attack()
	else:
		SaveSceneState.defeat(enemyName)
		SaveSceneState.loadCurrScene()

func _delete_everything() -> void:
	for i in get_children():
		i.queue_free()
