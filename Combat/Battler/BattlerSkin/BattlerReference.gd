extends Sprite

class_name BattlerReference

const TARGET_DISTANCE = 75
const TWEEN_DURATION = 0.75

onready var tween : Tween
onready var animationPlayer : AnimationPlayer

onready var battler : Battler
onready var direction : int

func _ready():
	tween = $Tween
	animationPlayer = $AnimationPlayer
	
	battler = get_parent()

	if battler is Enemy:
		direction = 1
	elif battler is Ally:
		direction = -1

func attackToEntity(target : Battler):
	var targetPosition : Vector2 = target.global_position + Vector2(direction * TARGET_DISTANCE, 0)
	
	tween.interpolate_property(
		self, 'global_position', battler.startPosition, targetPosition, TWEEN_DURATION, Tween.TRANS_QUAD, Tween.EASE_OUT)
	tween.start()
	
func returnToStart():
	tween.interpolate_property(
		self, 'global_position', global_position, battler.startPosition, TWEEN_DURATION, Tween.TRANS_QUAD, Tween.EASE_OUT)
	tween.start()

