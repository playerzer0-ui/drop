extends RigidBody2D

var speed = -2

func _physics_process(_delta):
	position += Vector2(0, speed)


func _on_speed_up_timeout():
	speed -= 1
