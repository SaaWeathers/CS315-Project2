extends CharacterBody2D


const SPEED = 100.0

@export var facing = 1


func _physics_process(delta: float) -> void:
	


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var dir = Input.get_vector("left", "right", "up", "down")
	
	self.velocity = dir * SPEED
	
	if dir.x < 0 and facing == 1:
		self.scale.x *= -1
		facing = -1
		$AnimatedSprite2D.play("walk")
	
	if dir.x > 0 and facing == -1:
		self.scale.x *= -1
		facing = 1
		$AnimatedSprite2D.play("walk")
	if dir.is_zero_approx():
		$AnimatedSprite2D.play("idle")
		pass
	

	move_and_slide()
