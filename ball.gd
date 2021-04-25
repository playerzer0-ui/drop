extends KinematicBody2D

#resources
export (int) var speed = 500
export (int) var jump_speed = -900
export (int) var gravity = 500
export (float, 0, 1.0) var friction = 0.1
export (float, 0, 1.0) var acceleration = 0.25

signal player_death

var velocity = Vector2.ZERO
onready var scores = get_parent().get_node("CanvasLayer/score")
onready var game_score = get_parent().get_node("gameover/Label")
onready var audio = $AudioStreamPlayer
onready var row = get_node("10row")
var score = 0

#input process
func get_input():
	var dir = 0
	if Input.is_action_pressed("ui_right"):
		dir += 1
	if Input.is_action_pressed("ui_left"):
		dir -= 1
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor():
			velocity.y = jump_speed

#score triggering
func _on_detect_area_entered(area):
	if area.name == "trigger":
		print("score")
		score += 1
		audio.play()
		scores.text = str(score)
		game_score.text = "score\n" + str(score)
		if score % 10 == 0:
			row.play()

#on death
	if area.name == "Area2D":
		print("DEATH")
		queue_free()
		emit_signal("player_death")
