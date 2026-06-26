extends Node

var output : RichTextLabel

func register_console(console: RichTextLabel):
	output = console


func clear():
	if output:
		output.clear()


func gorilla(text):
	print("Output:", output)
	print("Message:", text)
	if output == null:
		push_error("Console output is NULL!")
		return

	if output:
		output.append_text("[color=lime]Gorilla Frys:[/color] " + text + "\n\n")


func python(text):
	if output:
		output.append_text("[color=cyan]Python:[/color] " + text + "\n\n")


func error(text):
	if output:
		output.append_text("[color=red]Error:[/color] " + text + "\n\n")


func player(text):
	if output:
		output.append_text("[color=black]>>> " + text + "[/color]\n\n")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
