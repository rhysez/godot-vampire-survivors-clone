extends CharacterBody2D

@onready var player = get_node("/root/Game/Player")

func _physics_process(delta: float) -> void:
	# Sets the direction to the direction of the player's position in the game.
	var direction = global_position.direction_to(player.global_position)
	# Sets the velocity, to make the mob move. 
	velocity = direction * 300
	# Start movement.
	move_and_slide()
	
