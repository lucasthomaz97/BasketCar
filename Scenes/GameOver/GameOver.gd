extends Control

func show_ui() -> void:
	ScoreManager.save_score()
	$VBoxContainer/Retry.grab_focus()
	$VBoxContainer/TopScore.text = 'Top Score: '+str(ScoreManager.load_score())
	$VBoxContainer/Score.text = 'Your Score: '+str(ScoreManager.score)
	if ScoreManager.score >= ScoreManager.load_score():
		$VBoxContainer/Label.text = 'NEW TOP SCORE!!!'
	
	visible = true

func _on_retry_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu/Menu.tscn")
	get_tree().paused = false
