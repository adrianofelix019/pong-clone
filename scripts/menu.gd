extends Control


func _ready() -> void:
	pass

func _on_cpu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_sair_pressed() -> void:
	get_tree().quit()
