extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print(self.name)
	if body.name == "Rack":
		%Rack.position.x = Global.CheckpointX
		%Rack.position.y = Global.CheckpointY
		Global.Health = 100
