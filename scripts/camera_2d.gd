extends Camera2D

#curtjs from youtube came in clutch for the camera shake
@export var max_shake: float = 10.0
@export var shake_fade: float = 10.0

var shake_strength: float = 10.0
# Called when the node enters the scene tree for the first time.

func trigger_shake():
	shake_strength = max_shake
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if shake_strength > 0:
		shake_strength = lerp(shake_strength, 0.0, shake_fade * delta)
		offset = Vector2(randf_range(-shake_strength, shake_strength), randf_range(-shake_strength, shake_strength))
	pass

func when_dead():
	self.position = get_parent().position
