extends Node
class_name Upgrade

@export var player: Player
@export var cooldown_timer: Timer
@export var active_timer: Timer
@export var time_price: float
signal reduce_time(time_price: float)
var is_active: bool = false
var is_on_cooldown: bool = false

func _ready() -> void:
	active_timer.timeout.connect(_on_active_timer_timeout)
	cooldown_timer.timeout.connect(_on_cooldown_timer_timeout)

func activate():
	if !is_on_cooldown and !is_active:
		print("UPGRADE ACTIVATED!")
		reduce_time.emit(time_price)
		is_active = true
		power_up()
		active_timer.start()

func _on_active_timer_timeout() -> void:
	is_active = false
	power_down()
	print("not active anymore!")
	if !is_on_cooldown:
		is_on_cooldown = true
		cooldown_timer.start()


func _on_cooldown_timer_timeout() -> void:
	is_on_cooldown = false
	print('not on cooldown anymore!')

func power_up(): pass
func power_down(): pass
