extends Area2D

func _ready() -> void:
	body_entered.connect(_playerCollided)
	
func _playerCollided(body: Node2D) -> void:
	if(body is CharacterBody2D):
		SignalBus.defeated.emit()
