extends Camera3D
@onready var animPlayer: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_stopMoving()

func _startMoving():
	animPlayer.play("Walk")

func _stopMoving():
	animPlayer.play("Idle")
