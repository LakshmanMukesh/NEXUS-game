extends CanvasLayer

var FILE_PATH : String
var dialogue = []
var current_dialogue_id = -1
var dialogue_active  :bool = false
@onready var player = $"../../player"

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
	if event.is_action_pressed("interact"):
		next_line()
		
func next_line():
	current_dialogue_id += 1
	if current_dialogue_id >= len(dialogue):
		$Timer.start()
		$TextureRect.visible = false
		turn_player_set_active()
		return
	$TextureRect/NameLabel.text = dialogue[current_dialogue_id]['name']
	$TextureRect/DialogueText.text = dialogue[current_dialogue_id]['text']

	
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
