extends Area2D

func _physics_process(delta: float) -> void:
	var mobs_in_range = get_overlapping_bodies()
	var is_targetable_mob = has_detected_mobs(mobs_in_range)
	if is_targetable_mob:
		var target_mob = mobs_in_range[0]
		look_at(target_mob.global_position)

func has_detected_mobs(mob_count: Array) -> bool:
	if mob_count.size() > 0:
		return true
	
	return false

func shoot():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)

func _on_timer_timeout() -> void:
	if has_detected_mobs(get_overlapping_bodies()):
		shoot()
