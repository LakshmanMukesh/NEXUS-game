extends Area2D

var is_player_near : bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$interact_guide.visible = false
	$AnimatedSprite2D.play("default")

func _on_body_entered(body: Node2D) -> void:
	print("ENTERED:", body.name)
	if body.name == "player":
		$interact_guide.visible = true
		$interact_guide.play("default")
		is_player_near = true
		print("Player entered")
		
func _on_body_exited(body: Node2D) -> void:
	print("EXITED:", body.name)
	if body.name == "player":
		$interact_guide.visible = false
		is_player_near = false
		print("Player exited")


func _process(_delta):
	if Input.is_action_just_pressed("interact"):
		print("Action Pressed")
	if is_player_near:
		print("Player is near")
	if is_player_near and Input.is_action_just_pressed("interact"):
		pickup()

func pickup():
	print("Knife picked up!")
	var player = get_tree().current_scene.get_node("player")
	player.inventory.append("cyber_knife")
	# TODO
	# Give knife to player

	queue_free()




 
