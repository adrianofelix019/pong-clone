extends Area2D


var speed := 200.0
var direction: Vector2

func _ready() -> void:
	position = get_viewport_rect().size / 2
	direction = random_direction()


func random_direction() -> Vector2:
	return Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()


func _physics_process(delta: float) -> void:
	position += direction * speed * delta
