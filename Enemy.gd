extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var BOMB = load("res://bomb.tscn")

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func shoot():
	var b = BOMB.instantiate()
	b.rotate(-90)
	get_parent().add_child(b)
	b.global_transform = $Marker2D.global_transform

func _physics_process(delta):
	
	$Enemy.play("idle")
	$Cannon.play("idle")
	
	if not is_on_floor():
		velocity.y += gravity-1000 * delta
		
	move_and_slide()


func _on_timer_timeout():
	$Cannon.play("attack")
	shoot()
