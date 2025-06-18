extends Area2D


func _on_body_entered(body: Node2D) -> void:
	Global.Health -= 50
	print("I GOT HIT")
	print(Global.Health)
