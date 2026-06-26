extends CanvasLayer

@onready var output = $"output&comment"
@onready var player = $"../../Player/player"
var active = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	
	ConsoleManager.register_console(output)



# Called every frame. 'delta' is the elapsed time since the previous frame.

func on_open() -> void:
	visible = true
	active = true
func _on_close_button_pressed() -> void:
	visible = false
	active = false
	turn_player_set_active()
	
func turn_player_set_active():
	if player:
		player.set_active(true)


func _on_run_button_pressed():

	var code = $CodeEdit.text

	PythonInterpreter.run(code)
	LessonManager.check(code)
