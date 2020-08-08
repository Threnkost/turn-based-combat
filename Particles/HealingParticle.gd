extends Particles2D

onready var _time : float
onready var _timer : Timer = $Timer

func addAsChild(target : Object, time : float) -> void:
	_time = time
	target.call_deferred("add_child", self)

func _ready():
	emitting = true
	_timer.one_shot = true
	_timer.wait_time = _time
	_timer.start()

func _on_Timer_timeout():
	emitting = false
	_timer.stop()
	yield(get_tree().create_timer(1), "timeout")
	queue_free()
