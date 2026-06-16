extends CharacterBody2D

var player_near = false

func _process(_delta):
	if player_near and Input.is_action_just_pressed("interact"):
		print("GORILLA FRYS INTERACTED")

func _on_detection_area_body_entered(body):
	print("ENTERED:", body.name)

	if body.name == "player":
		player_near = true

func _on_detection_area_body_exited(body):
	print("EXITED:", body.name)

	if body.name == "player":
		player_near = false
