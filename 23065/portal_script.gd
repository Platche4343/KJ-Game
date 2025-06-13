extends Area2D

@export var teleport_x : int
@export var teleport_y : int

func _on_body_entered(body: Node2D) -> void:
	print(self.name)
	if body.name == "rack":
		%rack.global_position.x = teleport_x
		%rack.global_position.y = teleport_y
