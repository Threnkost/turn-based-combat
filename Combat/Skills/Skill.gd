extends IAction

class_name ISkill

signal skill_completed

export (String, MULTILINE) var skillDescription = "A skill."

export (int) var cooldown = 0
export (int) var manaCost = 0

func execute(args := []) -> void:
	print("")
	print("Skill Name : ", name)
	print("Skill Description : ", skillDescription)
	print("Skill Cooldown : ", cooldown)
	print("Skill Cost : ", manaCost)
	print("Skill Args : ", args)
	print("")