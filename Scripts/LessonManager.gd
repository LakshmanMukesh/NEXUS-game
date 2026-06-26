extends Node



func start_lesson():
	print("start_lesson(), stage =", GameManager.quest_stage)
	match GameManager.quest_stage:
		2:
			ConsoleManager.gorilla("Alright, let's start with the basics.")
			ConsoleManager.gorilla("Start by making the computer, show a message.")
			ConsoleManager.gorilla("For this, you use print() function.")
			ConsoleManager.gorilla("Write the code i give you now.")


			
			ConsoleManager.python('print("Hello")')

		3:
			ConsoleManager.gorilla("Great! Now create a variable called health.")
			
func check(code):
	match GameManager.quest_stage:
		2:
			
			if code.strip_edges() == 'print("Hello")' or code.strip_edges() == 'print("hello")':
				ConsoleManager.clear()
				ConsoleManager.gorilla("That's it my Boy! You're a fast learner")
				ConsoleManager.gorilla("Mostly because you got me as your mentor.. hehe")
				ConsoleManager.gorilla("But still you're okay... Just not upto my level.")
				ConsoleManager.gorilla("Now it's time for variables, fix the knife by declaring health as the variable and set it to 100.")
				ConsoleManager.gorilla("Remember, even though you can put whatever name you want as variable, it is always good practice to name it meaningful.")
				ConsoleManager.gorilla("Instead of vaguely naming it as ''a' or 'b'.")




				print("Before:", GameManager.quest_stage)

				GameManager.quest_stage = 3

				print("After:", GameManager.quest_stage)

				GameManager.check_stage()
				
		3:
			if PythonInterpreter.variables.has("health"):
				ConsoleManager.clear()
				ConsoleManager.gorilla("Perfect! Now the knife is fixed up! Now close the terminal with the X on the right corner")
				GameManager.quest_stage = 4
