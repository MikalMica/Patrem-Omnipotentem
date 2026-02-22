extends TextureRect

func _ready() -> void:
	modulate = Color.TRANSPARENT
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color(1,1,1,48.0/256.0), 120)
