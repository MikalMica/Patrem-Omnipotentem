extends CanvasLayer
class_name TextFadeIn

@export var animation_player : AnimationPlayer

func _ready() -> void:
	visible = false
	DialogueManager.dialogue_ended.connect(func(_diaalogue): visible = false)
	
func fade_in() -> void:
	animation_player.play("fade_in")
