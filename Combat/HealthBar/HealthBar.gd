extends TextureProgress

const TWEEN_DURATION = 0.2

func initialize(health : int, maxHealth : int) -> void:
	max_value = maxHealth
	value = health

sync func updateCurrentValue(health : int) -> void:
	$Tween.interpolate_property(self, 'value', value, health, TWEEN_DURATION, Tween.TRANS_QUAD, Tween.EASE_OUT)
	$Tween.start()

sync func updateMaxValue(health : int) -> void:
	$Tween.interpolate_property(self, 'max_value', max_value, health, TWEEN_DURATION, Tween.TRANS_QUAD, Tween.EASE_OUT)
	$Tween.start()
