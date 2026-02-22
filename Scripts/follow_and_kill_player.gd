extends Sprite2D
class_name FollowObstacle

@onready var player : CharacterBody2D = get_tree().get_nodes_in_group("Player2D")[0]
var direction := Vector2.ZERO
var rotation_time : float = 2.
var speed : float = 100.
var speed_factor = 2

@export var lifeTime = 10.

var current_time : float = .0 

signal waiting

func _ready() -> void:
	get_tree().create_timer(lifeTime).timeout.connect(despawn)

func _process(delta: float) -> void:
	current_time += delta
	if(current_time < rotation_time):
		_look_towards_player()
		return 
		
	position += direction * speed * speed_factor * delta
	
func _look_towards_player() -> void:
	look_at(player.global_position)
	rotate(PI/2)
	direction = (player.global_position - global_position).normalized()

func despawn() -> void:
	speed = 0
	waiting.emit()
	await ($Trail as trail).trailDespawned
	queue_free()
