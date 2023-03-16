extends Control

func unpause() -> void:
	visible = false
	get_tree().paused = false

func _process(delta):
	if Input.is_action_pressed("pause") and !get_tree().paused:
		get_tree().paused = true
		$VBoxContainer/Continue.grab_focus()
		visible = true
	elif visible and Input.is_action_pressed("pause"):
		unpause()

func _on_continue_pressed():
	unpause()

func _on_quit_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu/Menu.tscn")
