extends CharacterBody3D


@export var shooting: bool = true
@export var max_health: float = 100.0
@export var move_speed: float = 5.0
@export var follow_distance: float = 2.0

@onready var timer = $Timer

@onready var bullet = preload("res://Objects/Bullet/bullet.tscn")

@onready var player_node: Node3D = get_tree().get_first_node_in_group("player_body")


@onready var text_manager: TextManager = get_tree().get_first_node_in_group("text_manager")

var health = max_health

@onready var shoot_spot = $Marker3D
@onready var damage_text: DamageText = $DamageText


func _ready():
	timer.start()
	

func _physics_process(delta):
	# aim at player
	var direction = position - player_node.position
	look_at(player_node.position)
	
	# move based on follow distance
	if direction.x >= follow_distance and direction.z >= follow_distance:
		velocity = -move_speed * direction.normalized()
		
		move_and_slide()


func take_damage(damage):
	health -= damage
	print(damage)
	damage_text.add_damage_text(damage)
	print("aftee")
	if health <= 0:
		queue_free()
		print(text_manager)
		text_manager.display_text_player("I Died")
		
	

func _on_timer_timeout():
	var b: Node3D = bullet.instantiate()
	shoot_spot.add_child(b)
	
	# in case of immediate destruction after entering scene 
	if (player_node != null):
		b.look_at(player_node.position) 
		b.shoot = true
	
	
	timer.start()
	
	

