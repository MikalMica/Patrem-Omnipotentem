extends CanvasLayer

var wires:Array[AnimationPlayer]

func _input(event: InputEvent) -> void:
	if OS. has_feature("editor"):
		if event.is_action_pressed("trans_test"):
			TransitionCanvas.play()

func play() -> void:
	for child in get_children():
		child.hide()
		var anim_player:AnimationPlayer = child.get_node("AnimationPlayer")
		wires.push_back(anim_player)
		
	wires.shuffle()
	
	for wire:AnimationPlayer in wires:
		wire.get_parent().show()
		wire.play(&"start")
		await get_tree().create_timer(0.01).timeout
	
	#await get_tree().create_timer(1).timeout
	#
	#for wire:AnimationPlayer in wires:
		#wire.play_backwards(&"start")
		#await get_tree().create_timer(0.05).timeout
