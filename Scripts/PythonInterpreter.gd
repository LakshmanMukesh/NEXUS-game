extends Node
var variables = {}

func run(code: String):
	
	variables.clear()


	var lines = code.split("\n")

	for line in lines:
		line = line.strip_edges()

		if line == "":
			continue

		if line.begins_with("print("):
			handle_print(line)
		elif "=" in line:
			handle_assignment(line)
		else:
			ConsoleManager.error("Unknown command: " + line)

func handle_print(line: String):
	var text = line.trim_prefix("print(")
	text = text.trim_suffix(")")
	text = text.strip_edges()
	
	if text.begins_with("\"") and text.ends_with("\""):
		text = text.trim_prefix("\"")
		text = text.trim_suffix("\"")
		ConsoleManager.python(text)
		
	elif variables.has(text):
		ConsoleManager.python(str(variables[text]))
	
	else:
		ConsoleManager.error("NameError: " + text + " is not defined")
	
func handle_assignment(line: String):
	var parts = line.split("=")
	if parts.size() != 2:
		ConsoleManager.error("Invalid assignment.")
		return
		
	var name = parts[0].strip_edges()
	var value = parts[1].strip_edges()
	
	variables[name] = value
	
