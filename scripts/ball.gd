extends Area2D


var speed := 200.0
var speed_increase := 20.0
var max_speed := 800.0
var direction: Vector2


func _ready() -> void:
	position = get_viewport_rect().size / 2
	direction = random_direction()


func _physics_process(delta):
	position += direction * speed * delta
	var screen_size = get_viewport_rect().size

	# Rebater nas paredes superior e inferior
	if position.y <= 0 or position.y >= screen_size.y:
		direction.y = -direction.y
		increase_speed()


func random_direction() -> Vector2:
	return Vector2(randf_range(-1, 1), randf_range(-0.5, 0.5)).normalized()


func increase_speed() -> void:
	speed = min(speed + speed_increase, max_speed)


func _on_body_entered(_body: Node2D) -> void:
	direction.x = -direction.x
