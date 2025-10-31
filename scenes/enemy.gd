extends Area2D




func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	print("Hey You are taking damage")
	get_parent().get_child(4).get_child(2).trigger_shake()
	pass # Replace with function body.
