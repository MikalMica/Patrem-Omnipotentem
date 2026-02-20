extends Camera3D

@onready var Player = get_parent()

const CAMERA_TURN_SPEED = 200

func _ready():
	set_process_input(true)

func look_updown_rotation(new_rotation = 0):
	var toReturn = self.get_rotation() + Vector3(new_rotation, 0, 0)

	toReturn.x = clamp(toReturn.x, PI / -2, PI / 2)

	return toReturn

func look_leftright_rotation(new_rotation = 0):
	return Player.get_rotation() + Vector3(0, new_rotation, 0)

func _input(event):
	if not event is InputEventMouseMotion:
		return

	Player.set_rotation(look_leftright_rotation(event.relative.x / -CAMERA_TURN_SPEED))
	self.set_rotation(look_updown_rotation(event.relative.y / -CAMERA_TURN_SPEED))

func _enter_tree():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _leave_tree():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
