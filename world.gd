extends Node

onready var gameover = get_node("gameover")
onready var score_list = get_node("CanvasLayer/score")

func _ready():
	gameover.visible = false

func _on_Area2D_body_entered(body):
	if body.name != "ball":
		print("thiss")
		body.position = Vector2(rand_range(-120, 70), 1744)


func _on_ball_player_death():
	score_list.visible = false
	get_tree().paused = true
	gameover.visible = true
