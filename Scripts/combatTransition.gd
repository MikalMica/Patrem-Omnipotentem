extends AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play("Fade_out")
	animation_finished.connect(SignalBus.combatAnimationFinished.emit)
