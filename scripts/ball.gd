extends Area2D


var speed := 200.0
var speed_increase := 70.0
var max_speed := 800.0
var direction: Vector2
@onready var radius = $CollisionShape2D.shape.radius
var screen_size: Vector2


func _ready() -> void:
	screen_size = get_viewport_rect().size
	position = get_viewport_rect().size / 2
	direction = random_direction()


func _physics_process(delta):
	position += direction * speed * delta

	if position.y <= 0 or position.y >= screen_size.y:
		direction.y = -direction.y
		increase_speed()
	is_ball_off_the_screen()


func is_ball_off_the_screen():
	var x_offset = position.x + 15
	if x_offset < 0 or x_offset > screen_size.x:
		position = get_viewport_rect().size / 2
		speed = 200
		direction = random_direction()


func random_direction() -> Vector2:
	return Vector2(randf_range(-1, 1), randf_range(-0.5, 0.5)).normalized()


func increase_speed() -> void:
	speed = speed + speed_increase


func _on_body_entered(_body: Node2D) -> void:
	direction.x = -direction.x
