extends Node2D


func _ready() -> void:
	var ball_scene = preload("res://scenes/ball.tscn")
	var ball = ball_scene.instantiate()
	add_child(ball)
	add_player_to_scene()
	add_opponent_to_scene()


func add_player_to_scene():
	var player_scene = preload("res://scenes/player.tscn")
	var player = player_scene.instantiate()
	player.position.x = 30.0
	player.position.y = get_viewport_rect().size.y / 2
	add_child(player)


func add_opponent_to_scene():
	var opponent_scene = preload("res://scenes/opponent.tscn")
	var opponent = opponent_scene.instantiate()
	var screen_size = get_viewport_rect().size
	opponent.position.y = get_viewport_rect().size.y / 2
	opponent.position.x = screen_size.x - 30
	add_child(opponent)
