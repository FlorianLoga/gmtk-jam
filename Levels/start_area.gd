extends Area2D

@onready var spawn_pos: Marker2D = $Marker2D
@export var player: Player

func _ready() -> void:
	player.global_position = spawn_pos.global_position
