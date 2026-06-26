extends CanvasLayer

@onready var coding_terminal = $"../CodingTerminal"
@onready var player =$"../../Player/player"
@onready var dialogue_box = $"../../NPC/Gorilla Frys/DialogueBox"
 
# Called when the node enters the scene tree for the first time.


func _ready():
	visible = GameManager.laptop_unlocked
	
	
func _on_laptop_pressed() -> void:
	if dialogue_box.dialogue_active:
		return
	else:
		coding_terminal.on_open() 
		turn_player_set_inactive()


	
func turn_player_set_inactive():
	if player:
		player.set_active(false)
	
