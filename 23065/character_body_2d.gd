extends CharacterBody2D

@export var speed = 150
@export var dash = 10000
@export var jump_speed = -1000
@export var gravity = 2000

var oncooldown = false

var sprinting = false

func _physics_process(delta):
	# Add gravity every frame
	velocity.y += gravity * delta
	
	if Input.is_action_pressed("Shift"):
		sprinting = true
		speed = 400
		velocity.x = Input.get_axis("walk_left", "walk_right") * speed
	else:
		sprinting = false
		speed = 200
		velocity.x = Input.get_axis("walk_left", "walk_right") * speed
		
	if sprinting and Input.is_action_just_pressed("Space") and oncooldown == false:
		velocity.x = Input.get_axis("walk_left", "walk_right") * dash
		Cooldown(2)
		
	move_and_slide()
	
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_speed
func Cooldown(time):
	oncooldown = true
	await get_tree().create_timer(time).timeout
	oncooldown = false
	
	
	


func Die():
		%Rack.position.x = Global.CheckpointX
		%Rack.position.y = Global.CheckpointY
		Global.Health = 100
func  _process(delta):
	 
	if Global.Health == 0 or Global.Health <= 0:
		Die()
