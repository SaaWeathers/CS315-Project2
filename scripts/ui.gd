extends CanvasLayer

@onready var player_pos = get_node("/root/Level_1/Player")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.player_pos = player_pos
	pass
