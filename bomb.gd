extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var speed = 450
var rotation_speed = [-0.01, 0.01]
var is_exploding = true

func _physics_process(delta):
	
	position += transform.x * speed * delta
	rotate(rotation_speed[randi() % rotation_speed.size()])

	if not is_on_floor() and is_exploding:
		velocity.y += gravity * delta
		$AnimatedSprite2D.play("bombOn")
	
	gravity += 10

	move_and_slide()

func _on_timer_timeout():
	queue_free()

func _on_animation_timer_timeout():
	is_exploding = !is_exploding
	speed = 0
	$CPUParticles2D.queue_free()
	$AnimatedSprite2D.play("Explosion")
