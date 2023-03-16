extends Control

func _process(delta):
	$Score.text = 'Score: '+str(ScoreManager.score)
	$Time.text = str($GameTime.time_left).left(6).replace('.',':')
	if !get_parent().freeze and Input.is_action_pressed("acelerate") and $GameTime.is_stopped() and !get_tree().paused:
		$GameTime.start()

func _on_game_time_timeout():
	get_parent().end_game()
	visible = false
	ScoreManager.score = 0
	get_tree().paused = true
