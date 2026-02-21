extends Sprite2D
class_name FollowObstacle

@onready var player : CharacterBody2D = get_tree().get_nodes_in_group("Player2D")[0]
var direction := Vector2.ZERO
var rotation_time : float = 2.
var speed : float = 100.
var speed_factor = 2

var current_time : float = .0 

func _process(delta: float) -> void:
	current_time += delta
	if(current_time < rotation_time):
		_look_towards_player()
		return 
		
	position += direction * speed * speed_factor * delta
	
func _look_towards_player() -> void:
	look_at(player.global_position)
	direction = (player.global_position - global_position).normalized()
