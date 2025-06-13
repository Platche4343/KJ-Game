extends Area2D


func _on_body_entered(body: Node2D) -> void:
	print(self.name)
	if body.name == "rack":
		%rack.position.x = 14861
		%rack.position.y = -4330.33
