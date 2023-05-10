extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var BOMB = load("res://bomb.tscn")
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_flipped = false

func shoot():
	var b = BOMB.instantiate()
	get_parent().add_child(b)
	print($Marker2D.global_transform)
	b.global_transform = $Marker2D.global_transform

func _physics_process(delta):
	
	if Input.is_action_just_pressed("shoot"):
		shoot()
		
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if (velocity.x > 0):
		if(is_flipped):
			is_flipped = !is_flipped
		$AnimatedSprite2D.flip_h = is_flipped
		$AnimatedSprite2D.play("Run")
		
	elif(velocity.x < 0):
		if (!is_flipped):
			is_flipped = !is_flipped
		$AnimatedSprite2D.flip_h = is_flipped
		$AnimatedSprite2D.play("Run")
	
	elif(velocity.x == 0 and velocity.y == 0):
		$AnimatedSprite2D.play("Idle")
	
	elif(velocity.y != 0):
		$AnimatedSprite2D.play("Jump")

	move_and_slide()
