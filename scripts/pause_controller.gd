extends Node2D


func _ready():
	process_mode = Node2D.PROCESS_MODE_ALWAYS

func _input(event: InputEvent):
	if event.is_action_pressed("pause"):
		$"../CanvasLayer/PauseLayer".visible = !get_tree().paused
		get_tree().paused = !get_tree().paused
