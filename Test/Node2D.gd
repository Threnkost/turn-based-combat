extends Node2D

const TEST_RESOURCE = preload("res://Test/Test.tres")

export (Resource) var resource

func _ready():
	resource.prt()
	resource.amount = 31
	resource.prt()
