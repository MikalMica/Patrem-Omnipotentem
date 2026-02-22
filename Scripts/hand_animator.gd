extends CanvasLayer
class_name HandAnimator


@export var anim_player : AnimationPlayer

func _ready() -> void:
	self.visible = false
	SignalBus.toCombat.connect(transition_hand)
	
func transition_hand(path: String) -> void:
	self.visible = true
	anim_player.play("show")
	await anim_player.animation_finished
	SceneHandler.changeTo(path)
	await get_tree().create_timer(0.2).timeout
	TransitionCanvas.play()
	
func papear() -> void:
	self.visible = true
	anim_player.play("papear")
	$AudioStreamPlayer.pitch_scale = randf_range(0.9, 1.1);
	$AudioStreamPlayer.play();
	anim_player.animation_finished.connect(func(_any) -> void: self.visible = false)
