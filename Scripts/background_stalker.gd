extends Sprite2D
var combat_handler:CombatHandler

@export var alpha:float = 0.14901960784313725

func _ready() -> void:
	modulate = Color.TRANSPARENT
	combat_handler = get_parent().get_node("CombatHandler")
	
	DialogueManager.dialogue_ended.connect(dissappear)
	combat_handler.on_attack_despawned.connect(appear)

func appear():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color(Color.WHITE, alpha), 1.0)

func dissappear(_o):
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color.TRANSPARENT, 1.0)
