extends CharacterBody2D


const SPEED = 100.0
var inventory = []
func _physics_process(delta):
	player_movement(delta)

func player_movement(_delta):
	if Input.is_action_pressed("ui_up"):
		velocity.x = 0
		velocity.y = -SPEED
	elif Input.is_action_pressed("ui_down"):
		velocity.x = 0
		velocity.y = SPEED
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$AnimatedSprite2D.flip_h = false
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$AnimatedSprite2D.flip_h = true
		velocity.y = 0
	else:
		velocity.x=0
		velocity.y=0
	move_and_slide()
	
func set_active(active):
	set_physics_process(active)
	set_process(active)
	set_process_input(active)
