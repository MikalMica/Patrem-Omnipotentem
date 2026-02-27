extends Node2D
class_name CombatHandler

@export var attacks: Array[PackedScene]
@export var waitTime = 2.0
@export var dialogue: DialogueResource
@export var enemyName: String
@export var attack_settings:Array[AttackSettings]
var attacksSpawned = 0
var currIndex = 0
var currAttack : IAttack

signal on_attack_despawned

func _ready() -> void:
	if attack_settings.is_empty(): attack_settings.push_back(AttackSettings.new())
	
	await SignalBus.combatAnimationFinished
	_spawn_random_attack()
	SignalBus.defeated.connect(_delete_everything)

func _spawn_random_attack() -> void:
	if(attacks.size() == 0):
		return
	
	attacksSpawned += 1
	currAttack = attacks[currIndex].instantiate() as IAttack
	
	var attack_index:float = currIndex
	if currIndex >= attack_settings.size(): attack_index = attack_settings.size()-1
	
	var current_attack_setting:AttackSettings = attack_settings[attack_index]
	current_attack_setting.set_settings(currAttack)
		
	add_child(currAttack)
	currAttack.global_position = global_position
	currAttack.attack_finished.connect(_despawn_attack)
	
	currIndex += 1
	if currIndex >= attacks.size(): 
		attacks.shuffle()
		currIndex = 0

func _despawn_attack() -> void:
	on_attack_despawned.emit()
	remove_child(currAttack)
	if dialogue != null:
		var start = "Combat" + str(attacksSpawned)
		DialogueManager.show_dialogue_balloon(dialogue, start)
		await DialogueManager.dialogue_ended
	else: await get_tree().create_timer(waitTime).timeout
	if attacksSpawned < attack_settings.size():
		_spawn_random_attack()
	else:
		SaveSceneState.defeat(enemyName)
		SaveSceneState.loadCurrScene()

func _delete_everything() -> void:
	for i in get_children():
		i.queue_free()
