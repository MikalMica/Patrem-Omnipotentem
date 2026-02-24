extends Resource
class_name AttackSettings

@export var speed:float = 1.0
@export var density:int = 1
@export var lifeTime:float = 15.0
@export var radius:float = 250.0

func set_settings(attack:IAttack):
	attack.speed = speed
	attack.density = density
	attack.lifeTime = lifeTime
	attack.radius = radius
