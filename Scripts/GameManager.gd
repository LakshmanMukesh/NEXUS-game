extends Node

@onready var laptop_hud = get_tree().current_scene.get_node("UI/laptop_hud")
var laptop_unlocked = false
var quest_stage = 0
func _ready():
	pass

func check_stage():
	
	print("QUEST STAGE:", quest_stage)
	
	if quest_stage == 0 or quest_stage == 1:
		laptop_unlocked = false
		
	elif quest_stage == 2:
		laptop_unlocked = true
		laptop_hud.show()
		LessonManager.start_lesson()
	elif quest_stage == 3:
		print("STARTING LESSON 3")
		LessonManager.start_lesson()
		
