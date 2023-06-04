@tool
class_name DamageText
extends Node


@export var text_size: float = 12
@export var text_color: Color = Color(0.0, 0.0, 0.0)
@export var distance: float = 0.9

@onready var player_node: Node3D = get_tree().get_first_node_in_group("player_body")
#@onready var camera_aimcast: RayCast3D = get_tree().get_first_node_in_group("camera_aimcast")


func get_label_pos(pos: Vector3,):
	
	print("here")
	# get oosition on circle surrounding object that faces the player
	var diff = pos - player_node.position
	# add new circle position to starting position 
	var new_label_position = pos + diff.normalized()*distance
	
	print(new_label_position)
	
	return new_label_position


func add_damage_text(damage):
	var label: Label3D = Label3D.new()
	label.font_size = text_size
	
	print("top")
	print(get_parent().position)
	var new_label_position = get_label_pos(get_parent().position)
	
	print(get_parent().positon)
	print(new_label_position)
	
	label.position = new_label_position
	
	label.text = "-" + str(damage)
	
	get_parent().add_child(label)
	
	# delete text after 0.5 seconds
	# await get_tree().create_timer(0.5).timeout
	
	# label.queue_free()
	
	
	
	
	
	




