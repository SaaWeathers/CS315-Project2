extends Node

# Singleton (autoload) setup is recommended for easy global access
# You can add this script to autoload via Project Settings > AutoLoad
var total_cans = 0

var collected_cans = 0

var health = 3
@onready var health_bar = $ProgressBar


func _ready():
	# Optionally, count cans in the scene automatically
	total_cans = get_tree().get_nodes_in_group("Food").size()
	print("Cans: ", total_cans)

func add_can():
	collected_cans += 1
	print("Cans collected: %d / %d" % [collected_cans, total_cans])

func change_health(amount: int):
	health -= 1
	health_bar.value = health
	print(health)
