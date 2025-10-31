extends Node

var total_cans = 0
var collected_cans = 0
var health = 5

@onready var health_bar = $UI/ProgressBar
@onready var cans_left = $"UI/Number of cans"

var in_bed = false
var temp_cans = 0

func _ready() -> void:
	#count cans in the scene automatically based on how many I add to scene
	total_cans = get_tree().get_nodes_in_group("Food").size()
	print("Cans: ", total_cans)
	
	#gives value of total cans to temp_cans
	#now when we collect a can it will take away from temp instead of total 
	temp_cans = total_cans
	update_cans_label()

func _process(delta: float) -> void:
	
	#if player is in the bed, and they have all cans and they press e, then it will run
	#only here because it was being weird in the on_cat_bed function so i put it here
	#since it is something that needs to be constantly checked for
	if Input.is_action_pressed("use") and in_bed == true and collected_cans == total_cans:
			print("change level")
			level_change()

#only works when cat is in the bed
func level_change():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
	
#THESE FUNCTIONS ALL ARE FOR CANS
#cans is also just the food, in code its cans, but in the nodes and groups its food
func _on_food_body_entered(body: Node2D) -> void:
	add_cans()
	change_cans_left()
	pass

func add_cans():
	collected_cans += 1
	print("Cans collected: %d / %d" % [collected_cans, total_cans])

func change_cans_left():
	temp_cans -= 1
	update_cans_label()
	print(temp_cans)
	
func update_cans_label():
	cans_left.text = ": %d" % [temp_cans]
	
	
#for when the cat runs into things that hurt it
func change_health():
	health -= 1
	health_bar.value = health
	print(health)
	
	if health <=- 0:
		get_child(4).detect_death()

func _on_cat_bed_body_entered(body: Node2D) -> void:
	print("you are in bed")
	in_bed = true
	
	if collected_cans == total_cans:
			print("you have the right amount of cans")
	pass # Replace with function body.


func _on_enemy_body_entered(body: Node2D) -> void:
	change_health()
	
	pass # Replace with function body.
