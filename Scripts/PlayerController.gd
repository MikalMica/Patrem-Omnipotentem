extends CharacterBody3D

signal startMoving
signal stopMoving

@export var speed = 50.0
@export var sensibility = 0.01

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var ev: InputEventMouseMotion
		ev = event
		
		rotate_y(-ev.relative.x * sensibility)
	elif event.is_action_pressed("Moving"):
		startMoving.emit()
	elif event.is_action_released("Moving"):
		stopMoving.emit()
	elif event.is_action_pressed("Escape"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _physics_process(delta: float) -> void:
	var dir: Vector3 
	dir.z = Input.get_axis("Backward", "Forward")
	dir.x = Input.get_axis("Right", "Left")
	dir.y = 0
	dir += get_gravity()
	
	dir = dir.normalized()
	dir = dir.rotated(Vector3.UP, rotation.y)
	velocity = dir * speed
	
	move_and_slide()
