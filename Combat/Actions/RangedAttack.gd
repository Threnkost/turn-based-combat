extends IAction

class_name RangedAttack

#Parameters -> Attacker : Battler, Victim : Battler
func execute(args := []) -> void:
	var attacker : Battler = args[0]
	var victim : Battler = args[1]
	
	var bullet = load("res://Combat/Bullet.tscn").instance()
	bullet.initialize(attacker.global_position)
	turnQueue.battleground.add_child(bullet)
	bullet.shoot(victim)
	
	yield(bullet.tween, "tween_completed")
	victim.takeDamage(7)
	
	bullet.queue_free()
	turnQueue.skipTurn()
