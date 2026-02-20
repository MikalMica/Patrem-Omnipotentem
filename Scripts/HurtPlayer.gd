extends Area2D

func _playerCollided(body: Node2D) -> void:
	SignalBus.defeated.emit()
