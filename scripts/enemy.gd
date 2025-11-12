extends Area2D

@export var speed: float = 150
@export var detection_range: float = 300
@export var stopping_distance: float = 50

var player: CharacterBody2D = null
var velocity: Vector2 = Vector2.ZERO

func _ready() -> void:
	# Tenta encontrar o player automaticamente
	find_player()

func _process(delta: float) -> void:
	if player == null:
		find_player()
		return
	
	# Verifica se o player está dentro do alcance de detecção
	if global_position.distance_to(player.global_position) > detection_range:
		return
	
	# Calcula a direção para o player
	var direction: Vector2 = (player.global_position - global_position).normalized()
	
	# Para se estiver muito perto do player
	if global_position.distance_to(player.global_position) <= stopping_distance:
		velocity = Vector2.ZERO
	else:
		# Move na direção do player
		velocity = direction * speed
	
	# Atualiza a posição
	position += velocity * delta
	
	# Faz o inimigo olhar na direção do movimento (opcional)
	if velocity.length() > 0:
		rotation = velocity.angle()

func find_player() -> void:
	# Procura por nós com a tag "player" ou do tipo CharacterBody2D
	var players = get_tree().get_nodes_in_group("players")
	if players.size() > 0:
		player = players[0]
	else:
		# Tenta encontrar qualquer CharacterBody2D que possa ser o player
		var possible_players = get_tree().get_nodes_in_group("player")
		if possible_players.size() > 0:
			player = possible_players[0]
