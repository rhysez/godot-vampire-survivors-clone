extends Area2D

func _physics_process(delta: float) -> void:
	var mobs_in_range = get_overlapping_bodies()
	if mobs_in_range.size() > 0:
		var target_mob = mobs_in_range[0]
		look_at(target_mob.global_position)
