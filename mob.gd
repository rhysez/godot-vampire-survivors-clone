extends CharacterBody2D

@onready var player = get_node("/root/Game/Player")
var health = 3

func _ready() -> void:
	%Slime.play_walk()

func _physics_process(delta: float) -> void:
	# Sets the direction to the direction of the player's position in the game.
	var direction = global_position.direction_to(player.global_position)
	# Sets the velocity, to make the mob move. 
	velocity = direction * 300
	# Start movement.
	move_and_slide()
	
func take_damage() -> void:
	health -= 1
	%Slime.play_hurt()
	
	if health == 0:
		queue_free()
		const SMOKE_EXPLOSION = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_EXPLOSION.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
