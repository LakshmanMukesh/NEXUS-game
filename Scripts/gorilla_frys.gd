extends CharacterBody2D

var player_near = false
@onready var dialogue_player = $DialogueBox
@onready var player = $"../../Player/player"
@onready var coding_terminal = $"../../UI/CodingTerminal"

func _process(_delta):
	if player_near and Input.is_action_just_pressed("interact"):
		if coding_terminal.active:
			return
		if !dialogue_player.dialogue_active:
			find_use_dialogue()


func find_use_dialogue():
	dialogue_player = get_node_or_null("DialogueBox")

	if dialogue_player == null:
		return

	if coding_terminal.active:
		return

	match GameManager.quest_stage:
		0:
			dialogue_player.play("res://Dialogues/level1_dialogue.json")

		1:
			if "cyber_knife" in player.inventory:
				dialogue_player.play("res://Dialogues/level1_broken_knife_dialoue.json")

		2, 3:
			# Coding lesson is active.
			# Do not replay the broken-knife dialogue.
			pass

func _on_detection_area_body_entered(body):

	if body.name == "player":
		player_near = true

func _on_detection_area_body_exited(body):

	if body.name == "player":
		player_near = false
