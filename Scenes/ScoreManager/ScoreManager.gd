extends Node

var score: int = 0
var top_score: int = 0
const config_path = "user://top_score.json"

func load_score() -> int:
	if FileAccess.file_exists(config_path):
		var file = FileAccess.open(config_path, FileAccess.READ)
		var data = file.get_var()
		file.close()
		var sc: int = data.get("top_score")
		return sc
	else:
		return 0

func save_score():
	var best = load_score()
	if best == null or score > top_score:
		var data = {
		"top_score" : score
		}
		var file = FileAccess.open(config_path, FileAccess.WRITE)
		file.store_var(data)
		file.close()
