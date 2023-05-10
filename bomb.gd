extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var speed = 450
var rotation_speed = [-0.01, 0.01]

func _physics_process(delta):
	position += transform.x * speed * delta
	rotate(rotation_speed[randi() % rotation_speed.size()])
	if not is_on_floor():
		velocity.y += gravity * delta
		$AnimatedSprite2D.play("bombOn")

	move_and_slide()

func _on_Bullet_body_entered(body):
	pass
