extends CharacterBody2D

signal health_depleted

var health: float = 100.0

func check_health_state(delta: float) -> void:
	const DAMAGE_RATE: float = 5.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	var overlapping_mobs_count = overlapping_mobs.size()
	
	if overlapping_mobs_count > 0:
		health -= DAMAGE_RATE * overlapping_mobs_count * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleted.emit()

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector(
		"move_left", 
		"move_right", 
		"move_up", 
		"move_down"
	)
	velocity = direction * 600
	move_and_slide()
	
	var happy_boo = %HappyBoo
	if (velocity.length() > 0):
		happy_boo.play_walk_animation()
	else:
		happy_boo.play_idle_animation()
	
	check_health_state(delta)
