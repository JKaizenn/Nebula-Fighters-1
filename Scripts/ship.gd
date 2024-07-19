extends Node2D

@onready var spawner_component = $SpawnerComponent as SpawnerComponent
@onready var left_cannon = $LeftCannon
@onready var right_cannon = $RightCannon
@onready var fire_rate_timer = $FireRateTimer
@onready var scale_component = $ScaleComponent as ScaleComponent


func _ready():
	fire_rate_timer.timeout.connect(fire_lasers)
	pass 

func fire_lasers() -> void:
	spawner_component.spawn(left_cannon.global_position)
	spawner_component.spawn(right_cannon.global_position)
	scale_component.tween_scale()
