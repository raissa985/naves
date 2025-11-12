extends Area2D

@export var speed = 150  # Você pode ajustar a velocidade no inspetor
@onready var player = get_node("/root/Main/Player")

var life = 3


func _physics_process(delta: float) -> void:
	# Verifica se o nó do player ainda existe
	if player:
		# 1. Faz o inimigo "olhar" para a posição do player
		look_at(player.global_position)
		
		# 2. Pega o vetor "para frente" do inimigo (após a rotação do look_at)
		#    Isso é consistente com como seu player.gd (File 32) calcula a direção
		var direction = transform.x
		
		# 3. Move o inimigo (como é um Area2D, movemos a posição manualmente)
		global_position += direction * speed * delta


func _on_area_entered(area: Area2D) -> void:
	
	if area.is_in_group("laser"):
		
		area.queue_free()
		
		life -=1
		
		if life <= 0:
			
			speed = 0
			$Sprite2D.hide()
			$CollisionShape2D.disabled = true
			$CPUParticles2D.restart()
			
			await get_tree().create_timer(1).timeout
			
			queue_free()
			
			
	
	
	
	
	pass 
