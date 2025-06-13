extends CharacterBody2D


var SPEED = 190
const JUMP_VELOCITY = -900



func _physics_process(delta):
	#print(str(global_position.x) + ":" + str(global_position.y))
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# HAndle Sprint
	if Input.is_action_pressed("Shift") == true:
		SPEED = 300
	else: SPEED = 190
	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
