extends Node

var total_cans = 0

var collected_cans = 0

var health = 3
@onready var health_bar = $ProgressBar


func _ready():
	#count cans in the scene automatically based on how many I add to scene
	total_cans = get_tree().get_nodes_in_group("Food").size()
	print("Cans: ", total_cans)

func add_can():
	collected_cans += 1
	print("Cans collected: %d / %d" % [collected_cans, total_cans])

func change_health(amount: int):
	health -= 1
	health_bar.value = health
	print(health)


func _on_food_body_entered(body: Node2D) -> void:
	add_can()
	pass # Replace with function body.
