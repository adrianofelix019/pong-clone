extends CharacterBody2D


@export var speed := 400.0
var ball: Area2D
const ERROR_MARGIN := 10.0
var ceil_limit
var floor_limit


func _ready() -> void:
	find_ball()
	var _floor = 648.0
	ceil_limit = $CollisionShape2D.shape.size.y / 2
	floor_limit = _floor - $CollisionShape2D.shape.size.y / 2


func _physics_process(_delta):
	if GameConfig.game_mode == "CPU":
		move_towards_ball()
	elif GameConfig.game_mode == "PVP":
		var direction := 0.0
	
		if Input.is_action_pressed("p2up") and is_not_on_ceil():
			direction = -1.0
		if Input.is_action_pressed("p2down") and is_not_on_floor():
			direction = 1.0
		
		velocity.y = direction * speed
		move_and_slide()


func find_ball() -> void:
	ball = get_parent().get_node("Ball")


func move_towards_ball():
	if not ball:
		return

	var ball_y = ball.global_position.y
	var current_y = global_position.y
	if should_move_towards_ball():
		var direction = 0
		if ball_y > current_y + ERROR_MARGIN and is_not_on_floor():
			direction = 1
		elif ball_y < current_y - ERROR_MARGIN and is_not_on_ceil():
			direction = -1
		velocity = Vector2(0, direction * speed)
		move_and_slide()


func should_move_towards_ball() -> bool:
	var ball_direction = ball.direction.x
	if ball_direction > 0:
		return true
	if ball.global_position.x > get_viewport_rect().size.x * 0.5:
		return true
	return false


func is_not_on_ceil():
	return position.y >= ceil_limit


func is_not_on_floor():
	return position.y <= floor_limit
