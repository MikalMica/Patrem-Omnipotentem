extends CharacterBody3D

signal startMoving
signal stopMoving

@export var speed := 50.0
@export var horizontal_sensitivity := 0.01
@export var vertical_sensitivity := 0.005

@export var min_rotation := -50
@export var max_rotation := 50

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	rotation.x = 0

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		event = event as InputEventMouseMotion
		rotate_y(-event.relative.x * horizontal_sensitivity)
		
		rotate_object_local(Vector3.RIGHT, event.relative.y * vertical_sensitivity)
		rotation.x = clamp(rotation.x, deg_to_rad(min_rotation), deg_to_rad(max_rotation))
		
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
