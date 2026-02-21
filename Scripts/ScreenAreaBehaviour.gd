extends Node2D
class_name ScreenArea

@export var modules: Array[PackedScene]
@export var fadeInTime: float = 1.0
@export var areaLifeTime: float = 3.0
var areaOffset: float = 50.
var dirs = [-1, 0, 1]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(global_position)
	for i in range(0, 3):
		for j in range(0, 3):
			if randi() % 2 == 1:
				var mod = modules[randi() % modules.size()].instantiate() as FadeInArea
				mod.position = Vector2(dirs[i] * areaOffset, dirs[j] * areaOffset)
				mod.setSpeed(fadeInTime)
				add_child(mod)
				mod._playAnim()
				
	await get_tree().create_timer(areaLifeTime).timeout
	queue_free()
