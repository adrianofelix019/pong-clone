extends CharacterBody2D


var speed := 300.0


func _physics_process(_delta: float) -> void:
	var direction := 0.0
	
	if Input.is_action_pressed("up"):
		direction = -1.0
	if Input.is_action_pressed("down"):
		direction = 1.0
	
	velocity.y = direction * speed
	move_and_slide()
