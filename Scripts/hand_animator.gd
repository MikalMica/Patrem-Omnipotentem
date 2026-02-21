extends CanvasLayer
class_name HandAnimator


@export var anim_player : AnimationPlayer

func _ready() -> void:
	self.visible = false
	
func transition_hand() -> void:
	self.visible = true
	anim_player.play("show")
	
func papear() -> void:
	self.visible = true
	anim_player.play("papear")
	$AudioStreamPlayer.pitch_scale = randf_range(0.9, 1.1);
	$AudioStreamPlayer.play();
	anim_player.animation_finished.connect(func(_any) -> void: self.visible = false)
