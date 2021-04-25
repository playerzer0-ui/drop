extends Control


func _on_play_pressed():
	get_tree().change_scene("res://world.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_how_to_pressed():
	get_tree().change_scene("res://howto.tscn")
