extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var camera: Camera2D = $Camera

func _ready() -> void:
	player.set_camera(camera)
