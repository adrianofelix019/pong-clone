extends Node2D


func _ready() -> void:
	var ball_scene = preload("res://scenes/ball.tscn")
	var ball = ball_scene.instantiate()
	add_child(ball)
