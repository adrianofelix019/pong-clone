extends Area2D


signal player_scored
signal opponent_scored


var speed := 200.0
var speed_increase := 50.0
var max_speed := 800.0
var direction: Vector2
@onready var radius = $CollisionShape2D.shape.radius
var screen_size: Vector2


func _ready() -> void:
	screen_size = get_viewport_rect().size
	position = get_viewport_rect().size / 2
	direction = random_direction()


func _physics_process(delta) -> void:
	position += direction * speed * delta

	if position.y <= 0 or position.y >= screen_size.y:
		direction.y = -direction.y
		increase_speed()
	is_ball_off_the_screen()


func is_ball_off_the_screen() -> void:
	var right_edge = position.x + radius
	var left_edge = position.x - radius
	
	if right_edge < 0:
		emit_signal("opponent_scored")
		reset_ball_position()
	elif left_edge > screen_size.x:
		emit_signal("player_scored")
		reset_ball_position()


func reset_ball_position() -> void:
	position = get_viewport_rect().size / 2
	speed = 200
	direction = random_direction()


func random_direction() -> Vector2:
	return Vector2(randf_range(-1, 1), randf_range(-0.5, 0.5)).normalized()


func increase_speed() -> void:
	speed = speed + speed_increase


func _on_body_entered(_body: Node2D) -> void:
	direction.x = -direction.x
	var paddle = get_parent().get_node("Player")
	var paddle_height = paddle.get_node("CollisionShape2D").shape.extents.y * 2.0
	var relative_y = (position.y - paddle.position.y) / (paddle_height / 2.0)
	relative_y = clamp(relative_y, -1, 1)
	direction.y = relative_y * 0.75  
	direction.y += paddle.velocity.y * 0.002
	direction = direction.normalized()
	increase_speed()
