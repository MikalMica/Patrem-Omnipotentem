extends CharacterBody2D

@export var speed = 200.0
var canControl = true

func _ready() -> void:
	SignalBus.defeated.connect(changeControl)

func _input(event: InputEvent) -> void:
	if !canControl: return
	var dir: Vector2
	dir.x = Input.get_axis("Left", "Right")
	dir.y = Input.get_axis("Forward", "Backward")
	
	dir = dir.normalized()
	velocity = dir * speed

func _process(delta: float) -> void:
	move_and_slide()

func changeControl() -> void:
	velocity = Vector2(0, 0)
	canControl = !canControl
