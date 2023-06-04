extends RigidBody3D


@export var speed: float = 5
@export var damage: float = 20

@export var explosion_effect: GPUParticles3D



var shoot = false

var grow = false


func _ready():
	# stops moving hand moving fireball as well
	top_level = true
	


func _physics_process(delta):
	
	
	
	if shoot:
		apply_impulse(-transform.basis.z, transform.basis.z * speed)
		
	




func _on_area_3d_body_entered(body: Node3D):
	
	
	# deal damage 
	if body.has_method("take_damage"):
		body.take_damage(damage)
	
	# emit exposion 
	explosion_effect.emitting = true
	queue_free()
