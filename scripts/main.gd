extends Node2D


func _ready() -> void:
	var ball_scene = preload("res://scenes/ball.tscn")
	var ball = ball_scene.instantiate()
	add_child(ball)
	add_player_to_scene()


func add_player_to_scene():
	var player_scene = preload("res://scenes/player.tscn")
	var player = player_scene.instantiate()
	player.position.x = 30.0
	player.position.y = get_viewport_rect().size.y / 2
	add_child(player)
