extends Sprite2D
class_name FadeInArea

var area = preload("res://Scenes/Objects/bad_area.tscn")
@export var animator: AnimationPlayer

func _playAnim() -> void:
	animator.play("FadeIn")
	await animator.animation_finished
	var ar = area.instantiate()
	add_child.call_deferred(ar)

func setSpeed(newSpeed: float) -> void:
	animator.speed_scale = newSpeed
