extends Node

#Interface for Action classes.
class_name IAction

#To confirm the action is over.
signal action_completed

#Abstract method for inherited classes.
func execute(args := []) -> void:
	print("IAction Class -> Nothing") #Prints this message for debugging.
	pass