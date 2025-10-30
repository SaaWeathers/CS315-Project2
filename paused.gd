extends Control

func _ready() -> void:
	hide()
	pass

func _process(delta: float) -> void:
	test_esc()
	pass
	
# Called when the node enters the scene tree for the first time.
func resume():
	get_tree().paused = false
	hide()
func paused():
	show()
	get_tree().paused = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func test_esc():
	if Input.is_action_just_pressed("esc") and !get_tree().paused:
		paused()
	elif Input.is_action_just_pressed("esc") and get_tree().paused:
		resume()



func _on_resume_pressed() -> void:
	resume()
	pass # Replace withx function body.

func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()
	pass # Replace with function body.

func _on_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
