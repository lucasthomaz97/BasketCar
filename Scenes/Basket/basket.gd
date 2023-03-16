extends StaticBody3D

@export var method_name: String = 'reset_position'

func _on_area_3d_body_exited(body):
	if body.has_method(method_name):
		$Timer.start()
		$OK.play()
		ScoreManager.score += 1
		await $Timer.timeout
		body.reset_position()
		$OK.pitch_scale = randi_range(1, 3)
