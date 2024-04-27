extends CharacterBody2D

@onready var _focus = $focus
@onready var progress_bar = $ProgressBar
@onready var animation_player = $AnimationPlayer

@export var MAX_HEALTH: float = 10

var health: float = 10:
	set(value):
		health = value
		_update_progress_bar()
		_play_animation()

func _update_progress_bar():
	progress_bar.value = (health/MAX_HEALTH) * 100

func _play_animation():
	animation_player.play("hurt")

func focus():
	_focus.show()

func unfocus():
	_focus.hide()

func attack(target):
	target.take_damage(1)

func take_damage(value):
	health -= value
