extends CharacterBody3D

signal startMoving
signal stopMoving

@export var speed := 50.0
@export var horizontal_sensitivity := 0.01
@export var vertical_sensitivity := 0.005

@export var min_rotation := -50
@export var max_rotation := 50

var is_enabled := true

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	rotation.x = 0
	DialogueManager.dialogue_started.connect(func(dialogue) -> void: is_enabled = false)
	DialogueManager.dialogue_ended.connect(func(dialogue) -> void: is_enabled = true)

func _input(event: InputEvent) -> void:
	if not is_enabled: return
	
	if event is InputEventMouseMotion:
		event = event as InputEventMouseMotion
		rotate_y(-event.relative.x * horizontal_sensitivity)
		
	elif event.is_action_pressed("Moving"):
		startMoving.emit()
	elif event.is_action_released("Moving"):
		stopMoving.emit()
	elif event.is_action_pressed("Escape"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _physics_process(delta: float) -> void:
	if not is_enabled: return
	
	var dir: Vector3 
	dir.z = Input.get_axis("Backward", "Forward")
	dir.x = Input.get_axis("Right", "Left")
	dir.y = 0
	dir += get_gravity()
	
	dir = dir.normalized()
	dir = dir.rotated(Vector3.UP, rotation.y)
	velocity = dir * speed
	
	move_and_slide()
