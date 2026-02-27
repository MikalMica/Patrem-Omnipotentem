extends Node
class_name trail

@export var link: PackedScene
@export var bulletArea: Area2D
@export var linkLifeTime: float = 1.
var links: Array[Node2D]
var lastLink: Area2D
var timeBetweenDespawns = .2
var firstLink:Node2D

signal trailDespawned

func _ready() -> void:
	(bulletArea.get_parent() as FollowObstacle).waiting.connect(_despawnTrail)
	bulletArea.area_exited.connect(_spawnTrail)
	firstLink = link.instantiate() as Node2D
	firstLink.global_rotation = bulletArea.global_rotation + (PI/2)
	firstLink.global_position = bulletArea.global_position
	add_child(firstLink)
	firstLink.hide()
	firstLink.monitoring = false
	lastLink = firstLink as Area2D

func _spawnTrail(area: Area2D) -> void:
	if area == lastLink:
		if firstLink: firstLink.queue_free()
		var mLink = link.instantiate() as Node2D
		add_child.call_deferred(mLink)
		mLink.global_position = bulletArea.global_position
		mLink.global_rotation = bulletArea.global_rotation + (PI/2)
		links.push_back(mLink)
		lastLink = mLink as Area2D

func _despawnTrail() -> void:
	for i in range(0, links.size()):
		links[i].queue_free()
		if get_tree() == null: return
		await get_tree().create_timer(timeBetweenDespawns).timeout
	trailDespawned.emit()
