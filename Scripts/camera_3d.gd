extends Camera3D
class_name CameraMovement
@onready var Player = get_parent()

const CAMERA_TURN_SPEED = 200
var is_enabled : bool = true

func _ready():
	set_process_input(true)
	DialogueManager.dialogue_started.connect(func(_dialogue): enter_dialogue(true))
	DialogueManager.dialogue_ended.connect(func(_dialogue): enter_dialogue(false))

func look_updown_rotation(new_rotation = 0):
	var toReturn = self.get_rotation() + Vector3(new_rotation, 0, 0)

	toReturn.x = clamp(toReturn.x, PI / -2, PI / 2)

	return toReturn

func look_leftright_rotation(new_rotation = 0):
	return Player.get_rotation() + Vector3(0, new_rotation, 0)

func _input(event):
	if not is_enabled or not event is InputEventMouseMotion:
		return

	Player.set_rotation(look_leftright_rotation(event.relative.x / -CAMERA_TURN_SPEED))
	self.set_rotation(look_updown_rotation(event.relative.y / -CAMERA_TURN_SPEED))

func _enter_tree():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _leave_tree():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func enter_dialogue(enter : bool) -> void:
	is_enabled = not enter
	if(enter):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
