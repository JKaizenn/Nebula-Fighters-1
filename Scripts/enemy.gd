class_name Enemy

extends Node2D
@onready var stats_component = $StatsComponent as StatsComponent
@onready var hurt_component = $HurtComponent as HurtComponent
@onready var scale_component = $ScaleComponent as ScaleComponent
@onready var move_component = $MoveComponent as MoveComponent
@onready var shake_component  = $ShakeComponent as ShakeComponent
@onready var hitbox_component = $HitboxComponent as HitboxComponent
@onready var hurtbox_component = $HurtboxComponent as HurtboxComponent
@onready var visible_on_screen_notifier_2d = $VisibleOnScreenNotifier2D
@onready var destroyed_component = $DestroyedComponent as DestroyedComponent
@onready var score_component = $ScoreComponent as ScoreComponent


func _ready() -> void:
	stats_component.no_health.connect(func():
		score_component.adjust_score()
		)
		
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	hurtbox_component.hurt.connect(func(hithox: HitboxComponent):
		scale_component.tween_scale()
		shake_component.tween_shake()
	)
	stats_component.no_health.connect(queue_free)
	hitbox_component.hit_hurtbox.connect(destroyed_component.destroy.unbind(1))
	
