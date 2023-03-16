extends Node3D

@export var move_weight: float = 2.5

var direction: Vector3 = Vector3.FORWARD

func _physics_process(delta) -> void:
	var current_vel: Vector3 = get_parent().linear_velocity
	current_vel.y = 0
	if current_vel.length_squared() > 1:
		direction = lerp(direction, -current_vel.normalized(), move_weight*delta)
	global_transform.basis = get_rotation_from_direction(-direction)
	
func get_rotation_from_direction(look_direction: Vector3) -> Basis:
	look_direction = look_direction.normalized()
	var x_axis = look_direction.cross(Vector3.UP)
	return Basis(x_axis, Vector3.UP, -look_direction)
