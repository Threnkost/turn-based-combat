extends Sprite

#We can say BattlerReference is Battler's visual thing. Includes Sprite, AnimationPlayer, Tween etc.
class_name BattlerSprite

const TARGET_DISTANCE = 75
const TWEEN_DURATION = 0.5

#Nodes
onready var tween : Tween = $Tween
onready var animationPlayer : AnimationPlayer = $AnimationPlayer

#Variables
onready var battler : Battler = get_parent()
onready var direction : int

#Initializes variables.
func _ready():	
	direction = -1 if battler is Ally else 1

#Battler returns to his start point.
#Using tween.
func returnToStart():
	tween.interpolate_property(
		self, 'global_position', global_position, battler.startPosition, TWEEN_DURATION, Tween.TRANS_QUAD, Tween.EASE_OUT)
	tween.start()
	
#Battler goes to another battler.
#Using tween.
func goToEntity(target : Battler):
	var targetPosition : Vector2 = target.global_position + Vector2(direction * TARGET_DISTANCE, 0)
	
	tween.interpolate_property(
		self, 'global_position', battler.startPosition, targetPosition, TWEEN_DURATION, Tween.TRANS_QUAD, Tween.EASE_OUT)
	tween.start()