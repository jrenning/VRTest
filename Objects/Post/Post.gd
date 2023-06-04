extends CharacterBody3D

@export var max_health: float = 40.0

var health: float

func _ready():
	health = max_health

func take_damage(damage: float):
	health -= damage
	
	if health <= 0:
		queue_free()
		

func apply_knockback():
	pass
	
