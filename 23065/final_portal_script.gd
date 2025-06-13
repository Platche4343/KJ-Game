extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print(self.name)
	if body.name == "rack":
		get_tree().change_scene_to_file("res://level2.tscn")
