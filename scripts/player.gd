extends CharacterBody2D


var speed := 400.0
var ceil_limit
var floor_limit


func _ready() -> void:
	var _floor = 648.0
	ceil_limit = $CollisionShape2D.shape.size.y / 2
	floor_limit = _floor - $CollisionShape2D.shape.size.y / 2


func _physics_process(_delta: float) -> void:
	var direction := 0.0
	
	if Input.is_action_pressed("up") and is_not_on_ceil():
		direction = -1.0
	if Input.is_action_pressed("down") and is_not_on_floor():
		direction = 1.0
	
	velocity.y = direction * speed
	move_and_slide()


func is_not_on_ceil():
	return position.y >= ceil_limit


func is_not_on_floor():
	return position.y <= floor_limit
