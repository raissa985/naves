extends CharacterBody2D


var speed = 300


func _process(delta: float) -> void:
	
	move()
	pass


func move():
	
	var dirX = transform.x
	
	velocity = dirX * speed
	
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("forward"):
		move_and_slide()
	
	pass
