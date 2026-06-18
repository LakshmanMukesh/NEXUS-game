extends CharacterBody2D

var player_near = false
@onready var dialogue_player = $DialogueBox

func _process(_delta):
	if player_near and Input.is_action_just_pressed("interact"):
		if !dialogue_player.dialogue_active:
			find_use_dialogue()

func find_use_dialogue():
	var dialogue_player = get_node_or_null("DialogueBox")
	if dialogue_player:
		dialogue_player.play()

func _on_detection_area_body_entered(body):
	print("ENTERED:", body.name)

	if body.name == "player":
		player_near = true

func _on_detection_area_body_exited(body):
	print("EXITED:", body.name)

	if body.name == "player":
		player_near = false
