extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var speed = 350

func _physics_process(delta):
	position += transform.x * speed * delta
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()

func _on_Bullet_body_entered(body):
	pass
