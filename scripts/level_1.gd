extends Node

var total_cans = 0
var collected_cans = 0
var health = 5

@onready var health_bar = $UI/ProgressBar
@onready var cans_left = $"UI/Number of cans"

var in_bed = false
var temp_cans = total_cans

func _ready() -> void:
	#count cans in the scene automatically based on how many I add to scene
	total_cans = get_tree().get_nodes_in_group("Food").size()
	print("Cans: ", total_cans)

func _process(delta: float) -> void:
	
	cans_left.text = ": %d" % [temp_cans]
	
	if Input.is_action_pressed("use") and in_bed == true and collected_cans == total_cans:
			print("change level")
			level_change()



func add_cans():
	collected_cans += 1
	print("Cans collected: %d / %d" % [collected_cans, total_cans])

func change_cans_left():
	temp_cans -= 1
	print(cans_left)
	cans_left.text = ": %d" % [total_cans]
	
#for when the cat runs into things that hurt it
func change_health():
	health -= 1
	health_bar.value = health
	print(health)

#only works when cat is in the bed
func level_change():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	

func _on_food_body_entered(body: Node2D) -> void:
	add_cans()
	change_cans_left()
	$Food/Meow.play()
	pass


func _on_cat_bed_body_entered(body: Node2D) -> void:
	print("you are in bed")
	in_bed = true
	
	if collected_cans == total_cans:
			print("you have the right amount of cans")
	pass # Replace with function body.
