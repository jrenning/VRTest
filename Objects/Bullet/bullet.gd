extends CharacterBody3D

@export var speed: float = 5
@export var damage: float = 10.0

@onready var player_node: Node3D = get_tree().get_first_node_in_group("player_body")
@onready var timer = $Timer

var shoot: bool = false
var starting_position: Vector3


func _ready():
	top_level = true
	starting_position = position
	timer.start()
	

func _physics_process(delta):
	if shoot == true:
		
		
		# aim at player
		var direction = position - player_node.position
		look_at(player_node.position)
		velocity = -speed * direction.normalized()
		
		move_and_slide()


func _on_area_3d_body_entered(body: Node3D):
	# stop self desctruction
	if !body.is_in_group("bullet"):
		queue_free()


func _on_timer_timeout():
	# kill bullet after time is up
	queue_free()
