extends Area2D
var Touching = false
var oncooldown = false

func Cooldown(time):
	oncooldown = true
	await get_tree().create_timer(time).timeout
	oncooldown = false

func _on_body_entered(_body: Node2D) -> void:
	Touching = true
	
	print("I GOT HIT")
	print(Global.Health)
	


func _on_body_exited(_body):
	Touching = false

func _process(_delta):
	
	if Touching == true and oncooldown == false:
		Global.Health -= 25
		print(Global.Health)
		oncooldown = true
		await get_tree().create_timer(0.6).timeout
		oncooldown = false
	if Global.Health <= 0:
		Touching = false
