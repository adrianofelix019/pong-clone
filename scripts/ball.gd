extends RigidBody2D


var speed := 200.0
var speed_increase := 20.0
var max_speed := 800.0
var direction: Vector2


func _ready() -> void:
	position = get_viewport_rect().size / 2
	direction = random_direction()
	linear_damp = 0
	angular_damp = 0
	linear_velocity = direction * speed


func _physics_process(_delta):
	if position.y <= 0 or position.y >= get_viewport_rect().size.y:
		linear_velocity.y = -linear_velocity.y
		increase_speed()
	if position.x <= 0 or position.x >= get_viewport_rect().size.x:
		linear_velocity.x = -linear_velocity.x
		increase_speed()


func random_direction() -> Vector2:
	return Vector2(randf_range(-1, 1), randf_range(-0.5, 0.5)).normalized()


func increase_speed() -> void:
	speed = min(speed + speed_increase, max_speed)
	direction = linear_velocity.normalized()
	linear_velocity = direction * speed
