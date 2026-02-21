extends Sprite2D
class_name FollowObstacle

@onready var player_position : Vector2 = get_tree().get_nodes_in_group("Player2D")[0].global_position
var direction := Vector2.ZERO
var rotation_time : float = 2.
var speed : float = 1

var current_time : float = .0 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	current_time += delta
	if(current_time < rotation_time):
		_look_towards_player()
		return 
		
	position += direction * speed * delta
	
func _look_towards_player() -> void:
	look_at(player_position)
	direction = (global_position - player_position).normalized()
