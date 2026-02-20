extends AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.defeated.connect(_defeat_animation)
	play("Idle")

func _defeat_animation() -> void:
	play("Defeated")
	await animation_finished
	SignalBus.emit_signal("defeat_animation_ended")
