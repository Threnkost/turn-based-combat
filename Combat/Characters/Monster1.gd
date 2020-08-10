extends Enemy

#func playTurn(turnQueue : TurnQueue):
#	yield(get_tree().create_timer(0.35), "timeout")
#
#	var healAction = getAction("HealSkill")
#	healAction.execute([self, findLowHpTeamMate(turnQueue.battleground.enemies)])
#
#func findLowHpTeamMate(teamList := []) -> Enemy:	
#	teamList.sort_custom(self, "sort")
#	return teamList[0]
#
#func sort(enemyOne : Enemy, enemyTwo : Enemy) -> bool:
#	return enemyOne.healthPoint < enemyTwo.healthPoint
