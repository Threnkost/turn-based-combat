extends Sprite

const TWEEN_DURATION = 0.5

onready var tween : Tween = $Tween

func initialize(startPosition := Vector2(0, 0)) -> void:
	global_position = startPosition

func shoot(target : Battler) -> void:
	var targetPosition = target.global_position
	tween.interpolate_property(self, 'global_position' ,global_position, targetPosition, TWEEN_DURATION, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()
