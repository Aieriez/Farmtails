class_name DayNightCycleComponent
extends CanvasModulate

@export var initial_day: int = 1:
	set(d):
		initial_day = d
		DayNightCycleManager.initial_day = d
		DayNightCycleManager.set_initial_time()

@export var initial_hour: int = 12:
	set(h):
		initial_hour = h
		DayNightCycleManager.initial_hour = h
		DayNightCycleManager.set_initial_time()

@export var initial_minute: int = 30:
	set(m):
		initial_minute = m
		DayNightCycleManager.initial_minute = m
		DayNightCycleManager.set_initial_time()

@export var day_night_gradient_texture: GradientTexture1D

func _ready() -> void:
	DayNightCycleManager.initial_day = initial_day
	DayNightCycleManager.initial_hour = initial_hour
	DayNightCycleManager.initial_minute = initial_minute
	DayNightCycleManager.set_initial_time()
	DayNightCycleManager.game_time.connect(on_game_time)

func on_game_time(time: float) -> void:
	var sample_value =  0.5 * (sin(time - PI * 0.5) + 1.0)
	color = day_night_gradient_texture.gradient.sample(sample_value)
	
	
