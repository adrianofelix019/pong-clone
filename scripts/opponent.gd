extends CharacterBody2D


@export var speed := 300.0
var ball: Area2D
const ERROR_MARGIN := 5.0


func _ready() -> void:
	find_ball()


func _physics_process(_delta):
	move_towards_ball()


func find_ball() -> void:
	ball = get_parent().get_node("Ball")


func move_towards_ball():
	if not ball:
		return
	var ball_y = ball.global_position.y
	var current_y = global_position.y
	if should_move_towards_ball():
		var direction = 0
		if ball_y > current_y + ERROR_MARGIN:
			direction = 1
		elif ball_y < current_y - ERROR_MARGIN:
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
