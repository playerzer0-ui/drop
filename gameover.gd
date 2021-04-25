extends Control


func _on_retry_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()



func _on_home_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://start.tscn")
