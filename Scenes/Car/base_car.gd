extends VehicleBody3D

@export var hp: int = 720
@export var steer_speed: float = 0.7
@export var brake_power: int = 750
@export var max_speed: int = 3750
@export var mass_influence: float = 2.1
@export var can_reset: bool = true
@export var can_start: bool = false

var steer_angle: float = deg_to_rad(30)
@onready var original_pos: Vector3 = global_position
@onready var can_accelerate: bool = true

func end_game() -> void:
	$GameOverScreen.show_ui()

func reset_position()-> void:
	can_accelerate = false
	freeze = true
	global_position = original_pos
	linear_velocity = Vector3.ZERO
	rotation_degrees = Vector3.ZERO
	engine_force = 0  
	steering = 0 
	brake = 0
	$Timer.start()
	freeze = false
	await $Timer.timeout
	can_accelerate = true

func _process(delta) -> void:
	center_of_mass = global_transform.basis.z*1

func _physics_process(delta) -> void:
	freeze = !can_start
	var throtle_input = (Input.get_action_strength("acelerate") - Input.get_action_strength("brake"))*int(can_accelerate)
	var steer_input = (Input.get_action_strength("left")-Input.get_action_strength("right"))*throtle_input
	var brake_input = Input.get_action_strength("brake")
	engine_force = (throtle_input*(hp+mass*mass_influence))*(max_speed/linear_velocity.length_squared()) if throtle_input != 0 else throtle_input*hp
	steering = lerp_angle(steering, steer_input*steer_angle, steer_speed*delta)
	brake = brake_input*brake_power
	if linear_velocity.length_squared() != 0 and throtle_input != 0:
		$Engine.play()
		$Engine.pitch_scale += linear_velocity.length_squared()/1500000
	else:
		$Engine.pitch_scale = 1
	if Input.is_action_pressed("reset_car") and can_reset:
		reset_position()
