
@tool
class_name HealthComponent

extends Node

@export var max_health: float


signal health_depleted
signal damage_taken


func _ready():
	pass
	
	
func _physics_process(delta):
	handle_destruction()

func handle_destruction():
	if max_health <= 0:
		health_depleted.emit()
		
func take_damage(damage: float):
	max_health -= damage
	damage_taken.emit()
	
	
func heal(health: float):
	max_health += health
