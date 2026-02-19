extends CharacterBody3D


@export var speed = 5.0
@export var sensibility = 0.01

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var ev: InputEventMouseMotion
		ev = event
		
		rotate_y(-ev.relative.x * sensibility)
	else:
		# Ver como implementar gravedad
		var dir: Vector3 
		dir.z = Input.get_axis("Backward", "Forward")
		dir.x = Input.get_axis("Right", "Left")
	
		dir = dir.normalized()
		dir = dir.rotated(Vector3.UP, rotation.y)
		velocity = dir * speed

func _physics_process(delta: float) -> void:
	move_and_slide()
