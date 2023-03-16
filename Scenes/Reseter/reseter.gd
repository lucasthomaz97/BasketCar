extends Area3D

@export var method_name: String = 'reset_position'

func _on_body_entered(body):
	if body.has_method(method_name):
		body.reset_position()
