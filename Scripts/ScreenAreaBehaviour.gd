extends Node2D
class_name ScreenArea

@export var modules: Array[PackedScene]
@export var fadeInTime: float = 1
@export var areaLifeTime: float = 5.0
@export var areaModulesExt: int = 4
@export var areaSize: float = 300.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(global_position)
	for i in range(0, areaModulesExt):
		for j in range(0, areaModulesExt):
			if randi() % 2 == 1:
				var mod = modules[randi() % modules.size()].instantiate() as FadeInArea
				mod.position = Vector2((areaSize/areaModulesExt) * j, (areaSize/areaModulesExt) * i)
				mod.setSpeed(fadeInTime)
				add_child(mod)
				mod._playAnim()
				
	await get_tree().create_timer(areaLifeTime).timeout
	queue_free()
