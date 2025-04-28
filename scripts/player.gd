extends CharacterBody2D
class_name Player

@export_category("Variaveis")
@export var life: int = 100
@export var speed: float = 250.0
@export var jump_height: float = 128.0
@export var max_jumps: int = 2
@export var max_time_to_peak: float = 0.45
@export var air_friction: float = 0.76

# Handle Pulo e Gravidade
var jump_force
var gravity
var fall_gravity
var current_jumps: int = 0

@export_category("Objetos")
@export var texture: Sprite2D
@export var animation: AnimationPlayer
@export var remote_camera: RemoteTransform2D

func _ready() -> void:
	jump_force = (jump_height * 2) / max_time_to_peak
	gravity = (jump_height * 2) / pow(max_time_to_peak, 2)
	fall_gravity = gravity * 2

func _physics_process(delta: float) -> void:
	move_and_jump(delta)
	
	set_animate()
	move_and_slide()

func move_and_jump(delta: float) -> void:
	if !is_on_floor():
		velocity.x = 0
	
	if velocity.y > 0 or not Input.is_action_pressed("jump"):
		velocity.y += fall_gravity * delta
	else:
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor() or Input.is_action_just_pressed("jump") and current_jumps < max_jumps:
		velocity.y = -jump_force
		current_jumps += 1
	
	if is_on_floor() and current_jumps == max_jumps:
		current_jumps = 0
	
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = lerp(velocity.x, direction * speed, air_friction)
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

func set_animate() -> void:
	var anim = "idle"
	
	if velocity.x != 0:
		anim = "walk"
		if velocity.x > 0:
			texture.flip_h = false
		elif velocity.x < 0:
			texture.flip_h = true
	
	if animation.current_animation != anim:
		animation.play(anim)

func set_camera(camera):
	var camera_path = camera.get_path()
	remote_camera.remote_path = camera_path
