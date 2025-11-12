extends Area2D

@export var fireRate = 0.1
@export var laserSpeed = 800
@export var laserSize = Vector2(1,1)
@export var laserTexture : Texture2D
@export var laserColor : Color = Color.WHITE


func _on_area_entered(area: Area2D) -> void:
	
	if area.is_in_group("player"):
		
		var gun = area.get_parent().get_node("gun")
		
		gun.fireRate = fireRate
		gun.laserSpeed = laserSpeed
		gun.laserSize = laserSize
		gun.laserTexture = laserTexture
		gun.laserColor = laserColor
		
		
		queue_free()
	
	pass # Replace with function body.
