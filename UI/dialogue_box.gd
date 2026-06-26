extends CanvasLayer

var FILE_PATH : String
var dialogue = []
var current_dialogue_id = -1
var dialogue_active  :bool = false
@onready var player = $"../../../Player/player"
@onready var coding_terminal= $"../../../UI/CodingTerminal"

func _ready():
	$TextureRect.visible = false
	
func play(file_path: String):
	if dialogue_active:
		return
	FILE_PATH = file_path

	turn_player_set_inactive()
	dialogue_active = true
	dialogue = load_dialogue()
	$TextureRect.visible = true
	current_dialogue_id = -1
	next_line()

func _input(event):
	
	if event.is_action_pressed("interact") and coding_terminal.active == false:
		next_line()
	elif event.is_action_pressed("previous_dialogue") and coding_terminal.active == false:
		print("Previous key pressed") 
		previous_line()
	elif event.is_action_pressed("skip_dialogue") and coding_terminal.active == false:
		current_dialogue_id = dialogue.size()
		next_line()
		
func next_line():
	current_dialogue_id += 1
	if current_dialogue_id >= len(dialogue):
		print("QUEST STAGE:", GameManager.quest_stage)
		
		$Timer.start()
		$TextureRect.visible = false
		turn_player_set_active()
		if FILE_PATH == "res://Dialogues/level1_dialogue.json":
			GameManager.quest_stage = 1
			

		elif FILE_PATH == "res://Dialogues/level1_broken_knife_dialoue.json":
			GameManager.quest_stage = 2
			

		print("calling lesson")
		GameManager.check_stage()
		

		return
	$TextureRect/NameLabel.text = dialogue[current_dialogue_id]['name']
	$TextureRect/DialogueText.text = dialogue[current_dialogue_id]['text']

func previous_line():
	current_dialogue_id -= 1
	if current_dialogue_id <= 0:
		current_dialogue_id = 0
		
	$TextureRect/NameLabel.text = dialogue[current_dialogue_id]["name"]
	$TextureRect/DialogueText.text = dialogue[current_dialogue_id]["text"]
	
func load_dialogue():
		var json = JSON.new()
		var file = FileAccess.open(FILE_PATH, FileAccess.READ)
		var json_text = file.get_as_text()
		file.close()

		var error = json.parse(json_text)
		if error == OK:
			var data_received = json.data
			if typeof(data_received) == TYPE_ARRAY:
				print(data_received)
				return data_received
			else:
				print("Unexpected Data")
		else:
			print("JSON Prase Error: ", json.get_error_message(), " in ", json_text)


func _on_timer_timeout():
	dialogue_active = false
	
func turn_player_set_active():
	if player:
		player.set_active(true)
		
func turn_player_set_inactive():
	if player:
		player.set_active(false)
