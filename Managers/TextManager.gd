@tool
class_name TextManager

extends Label3D



@export var camera_aimcast: RayCast3D

@onready var player_node: Node3D = get_tree().get_first_node_in_group("player_body")

func get_label_pos(pos: Vector3, distance: Vector2):
	var direction = camera_aimcast.get_collision_point()
	
	# use y from the camera
	# add equal distance to x and z positions to get it at a diagonal
	
	# determine direction 
	var x_dir
	
	if (pos.x > direction.x):
		x_dir = -1
	else:
		x_dir = 1
		
	var z_dir 
	
	if (pos.z > direction.z):
		z_dir = -1
	else:
		z_dir = 1
		
	var new_label_position = Vector3(pos.x+distance*x_dir, direction.y+1.0, pos.z+distance*z_dir)
	
	return new_label_position


func display_text_player(display_text: String, distance: Vector2=Vector2(0.5, 0.5)):
	var pos = player_node.position
	
	var new_label_position = get_label_pos(pos, distance)
	
	
	
	text = display_text
	position = new_label_position
	

	
	
	
	
	
	
	
	
	


