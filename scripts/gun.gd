extends Node2D

var laser = preload("res://prefers/area_2d.tscn")

@export var fireRate = 0.5
var fireCooldown = 0.0

@export var laserSpeed = 800
@export var laserSize = Vector2(1,1)
@export var laserTexture : Texture2D
@export var laserColor : Color = Color.WHITE

func _ready() -> void:
	
	fireCooldown = fireRate
	pass
	
func _process(delta: float) -> void:
	shoot()
	pass
	
func shoot():
	
	fireCooldown -= get_process_delta_time()
	
	if Input.is_action_pressed("shoot") and fireCooldown <= 0.0:
		fireCooldown = fireRate
		
		var tiro = laser.instantiate()
		
		tiro.speed = laserSpeed
		tiro.scale = laserSize
		tiro.modulate = laserColor
		tiro.get_node("Sprite2D").texture = laserTexture
		
		tiro.global_position = $LaserPos.global_position
		
		get_tree().current_scene.add_child(tiro)
	
	pass
